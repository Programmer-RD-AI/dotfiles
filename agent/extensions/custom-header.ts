/**
 * Custom Header Extension
 *
 * Replaces the built-in startup header with an identical copy you can customize.
 * Edit the `buildHeader()` function below to change what's shown at startup.
 *
 * Usage: Just edit this file and run /reload in pi.
 * To restore the built-in header: rename/delete this file and /reload.
 */

import type { ExtensionAPI, Theme } from "@mariozechner/pi-coding-agent";
import { VERSION, keyHint, rawKeyHint } from "@mariozechner/pi-coding-agent";
import { Text } from "@mariozechner/pi-tui";

/**
 * Build the header text. This is what you customize.
 *
 * Currently replicates the built-in header exactly:
 *   - App name + version
 *   - Keybinding hints
 *
 * To customize, just edit the `logo` or `hints` array below.
 */
function buildHeader(theme: Theme): string {
	// ── Logo ──────────────────────────────────────────────
	// Change this to whatever you want as the title line.

	const ascii_art_2 = [
		"   ███████████████████████████╗  ",
		"   ╚══██████╔════════██████╔══╝  ",
		"      ██████║        ██████║     ",
		"      ██████║        ██████║     ",
		"      ██████║        ██████║     ",
		"      ██████║        ██████║     ",
		"      ██████║        ██████║     ",
		"      ██████║        ██████║     ",
		"   ████████████╗  ████████████╗  ",
		"   ╚═══════════╝  ╚═══════════╝  ",
	].map(line => theme.bold(theme.fg("success", line))).join("\n");

	const logo =
		"\n" + ascii_art_2 + "\n\n" +
		theme.bold(theme.fg("accent", "pi")) +
		theme.fg("dim", ` v${VERSION}`);

	// ── Keybinding hints ─────────────────────────────────
	// Each entry is one line. Remove, reorder, or add your own.
	// Use rawKeyHint("key", "description") for app-level shortcuts.
	// Use keyHint("editorAction", "description") for editor shortcuts.
	const hints = [
		rawKeyHint("escape", "to interrupt"),
		rawKeyHint("ctrl+c", "to clear"),
		rawKeyHint("ctrl+c twice", "to exit"),
		rawKeyHint("ctrl+d", "to exit (empty)"),
		rawKeyHint("ctrl+z", "to suspend"),
		keyHint("deleteToLineEnd", "to delete to end"),
		rawKeyHint("shift+tab", "to cycle thinking level"),
		rawKeyHint("ctrl+p/shift+ctrl+p", "to cycle models"),
		rawKeyHint("ctrl+l", "to select model"),
		rawKeyHint("ctrl+o", "to expand tools"),
		rawKeyHint("ctrl+t", "to expand thinking"),
		rawKeyHint("ctrl+g", "for external editor"),
		rawKeyHint("/", "for commands"),
		rawKeyHint("!", "to run bash"),
		rawKeyHint("!!", "to run bash (no context)"),
		rawKeyHint("alt+enter", "to queue follow-up"),
		rawKeyHint("alt+up", "to edit all queued messages"),
		rawKeyHint(process.platform === "win32" ? "alt+v" : "ctrl+v", "to paste image"),
		rawKeyHint("drop files", "to attach"),
	];

	//return `${logo}\n${hints.join("\n")}`;
	return logo
}



export default function (pi: ExtensionAPI) {
	pi.on("session_start", async (_event, ctx) => {
		if (!ctx.hasUI) return;

		ctx.ui.setHeader((_tui, theme) => ({
			render(_width: number): string[] {
				return buildHeader(theme).split("\n");
			},
			invalidate() {},
		}));
	});

	// Command to restore the built-in header
	pi.registerCommand("builtin-header", {
		description: "Restore the built-in startup header",
		handler: async (_args, ctx) => {
			ctx.ui.setHeader(undefined);
			ctx.ui.notify("Built-in header restored", "info");
		},
	});
}
