/**
 * Markdown Link Extension
 *
 * Links a .md file to the session for collaborative editing.
 * Agent responses are appended to the file (viewable rendered in Obsidian).
 * User edits the file directly, then sends changes back via /send-diff.
 *
 * Commands:
 *   /link-md <filepath>  — Link a markdown file to this session
 *   /unlink-md           — Unlink the current file
 *   /send-diff (or /sd)  — Send your edits as a message to the agent
 */

import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";
import * as fs from "node:fs";
import * as path from "node:path";

export default function (pi: ExtensionAPI) {
  let linkedFile: string | null = null;
  let lastKnownContent: string = "";

  // --- State restoration on session restart ---

  pi.on("session_start", async (_event, ctx) => {
    let lastLinkData: { file: string | null } | undefined;

    for (const entry of ctx.sessionManager.getEntries()) {
      if (entry.type === "custom" && entry.customType === "md-link") {
        lastLinkData = entry.data as { file: string | null } | undefined;
      }
    }

    if (lastLinkData?.file && fs.existsSync(lastLinkData.file)) {
      linkedFile = lastLinkData.file;
      lastKnownContent = fs.readFileSync(lastLinkData.file, "utf-8");
      const theme = ctx.ui.theme;
      ctx.ui.setStatus(
        "md-link",
        theme.fg("accent", "📄 ") + theme.fg("dim", path.basename(lastLinkData.file))
      );
    }
  });

  // --- Commands ---

  pi.registerCommand("link-md", {
    description: "Link a .md file for collaborative editing",
    handler: async (args, ctx) => {
      const filepath = args.trim();
      if (!filepath) {
        ctx.ui.notify("Usage: /link-md <filepath>", "warning");
        return;
      }

      const resolved = path.isAbsolute(filepath)
        ? filepath
        : path.resolve(ctx.cwd, filepath);

      // Create file + directories if needed
      if (!fs.existsSync(resolved)) {
        fs.mkdirSync(path.dirname(resolved), { recursive: true });
        fs.writeFileSync(resolved, "", "utf-8");
      }

      linkedFile = resolved;
      lastKnownContent = fs.readFileSync(resolved, "utf-8");
      pi.appendEntry("md-link", { file: resolved });

      const theme = ctx.ui.theme;
      ctx.ui.setStatus(
        "md-link",
        theme.fg("accent", "📄 ") + theme.fg("dim", path.basename(resolved))
      );
      ctx.ui.notify(`Linked: ${resolved}`, "success");
    },
  });

  pi.registerCommand("unlink-md", {
    description: "Unlink the current md file",
    handler: async (_args, ctx) => {
      if (!linkedFile) {
        ctx.ui.notify("No file linked", "warning");
        return;
      }
      const name = path.basename(linkedFile);
      linkedFile = null;
      lastKnownContent = "";
      pi.appendEntry("md-link", { file: null });
      ctx.ui.setStatus("md-link", undefined);
      ctx.ui.notify(`Unlinked: ${name}`, "info");
    },
  });

  // Shared handler for /send-diff and /sd
  const handleSendDiff = async (_args: string, ctx: any) => {
    if (!linkedFile) {
      ctx.ui.notify("No file linked. Use /link-md first.", "warning");
      return;
    }
    if (!ctx.isIdle()) {
      ctx.ui.notify("Wait for the agent to finish.", "warning");
      return;
    }
    if (!fs.existsSync(linkedFile)) {
      ctx.ui.notify(`File not found: ${linkedFile}`, "error");
      return;
    }

    const current = fs.readFileSync(linkedFile, "utf-8");
    if (current === lastKnownContent) {
      ctx.ui.notify("No changes detected.", "info");
      return;
    }

    const message = computeMessage(lastKnownContent, current);
    if (!message) {
      ctx.ui.notify("No meaningful changes.", "info");
      return;
    }

    lastKnownContent = current;
    pi.sendUserMessage(message);
  };

  pi.registerCommand("send-diff", {
    description: "Send your md file edits as a message",
    handler: handleSendDiff,
  });

  pi.registerCommand("sd", {
    description: "Alias for /send-diff",
    handler: handleSendDiff,
  });

  // --- Append assistant responses to linked file ---

  pi.on("message_end", async (event, _ctx) => {
    if (!linkedFile) return;

    const msg = event.message;
    if (!("role" in msg) || msg.role !== "assistant") return;

    // Skip intermediate messages that include tool calls —
    // only append the final text response
    const hasToolUse = msg.content.some((c: any) => c.type === "tool_use");
    if (hasToolUse) return;

    const textParts = msg.content
      .filter((c: any) => c.type === "text")
      .map((c: any) => (c.text as string).trim())
      .filter((t: string) => t.length > 0);

    if (textParts.length === 0) return;

    const text = textParts.join("\n\n");

    try {
      const current = fs.readFileSync(linkedFile, "utf-8");
      const prefix = current.trim().length > 0 ? "\n\n" : "";
      const updated = current + prefix + text + "\n\n---\n---\n";
      fs.writeFileSync(linkedFile, updated, "utf-8");
      lastKnownContent = updated;
    } catch {
      // File may have been deleted externally
    }
  });
}

// --- Diff computation ---

function computeMessage(oldContent: string, newContent: string): string | null {
  if (oldContent === newContent) return null;

  // Case 1: Simple append (most common — user wrote at the end)
  // This path sends the text exactly as-is, like typing in the TUI
  if (newContent.startsWith(oldContent)) {
    const appended = newContent.slice(oldContent.length).trim();
    return appended || null;
  }

  // Case 2: Inline edits — line-level diff
  const oldLines = oldContent.split("\n");
  const newLines = newContent.split("\n");

  // Find common prefix (identical lines from start)
  let start = 0;
  while (
    start < oldLines.length &&
    start < newLines.length &&
    oldLines[start] === newLines[start]
  ) {
    start++;
  }

  // Find common suffix (identical lines from end)
  let oldEnd = oldLines.length - 1;
  let newEnd = newLines.length - 1;
  while (
    oldEnd >= start &&
    newEnd >= start &&
    oldLines[oldEnd] === newLines[newEnd]
  ) {
    oldEnd--;
    newEnd--;
  }

  const removed = oldLines.slice(start, oldEnd + 1);
  const added = newLines.slice(start, newEnd + 1);

  if (removed.length === 0 && added.length === 0) return null;

  // Pure insertion (no lines removed) — send just the new text
  if (removed.length === 0) {
    return added.join("\n").trim() || null;
  }

  // Mixed changes (edits/replacements) — format with context
  const parts: string[] = [];

  // Add location context
  if (start > 0) {
    const ctx = oldLines[start - 1].trim().slice(0, 100);
    if (ctx) parts.push(`[After: "${ctx}"]`);
  }

  if (removed.length > 0) {
    parts.push("Removed:\n" + removed.join("\n"));
  }
  if (added.length > 0) {
    parts.push(
      (removed.length > 0 ? "Replaced with:\n" : "") + added.join("\n")
    );
  }

  return parts.join("\n\n").trim() || null;
}
