/**
 * /context — Visualize current context usage as a colored grid overlay.
 *
 * Shows a grid of colored squares representing token usage, broken down by:
 * - System prompt
 * - User messages
 * - Assistant text
 * - Assistant thinking
 * - Tool results (per tool: read, bash, edit, write, grep, find, ls, custom)
 * - Compaction summaries
 * - Custom/injected messages
 * - Images (estimated)
 * - Free space
 *
 * Also shows cache stats and optimization suggestions.
 */

import type {
	ExtensionAPI,
	ExtensionCommandContext,
	ContextUsage,
	Theme,
} from "@mariozechner/pi-coding-agent";
import type { AssistantMessage, ToolResultMessage, UserMessage } from "@mariozechner/pi-ai";
import { matchesKey, truncateToWidth, visibleWidth } from "@mariozechner/pi-tui";

// ── Category definitions ──────────────────────────────────────────────

interface Category {
	key: string;
	label: string;
	tokens: number;
	color: (theme: Theme, text: string) => string;
	square: string; // The actual rendered square character
}

// Color helpers using ANSI 256-color codes for richer palette
const ansi256Fg = (code: number, text: string) => `\x1b[38;5;${code}m${text}\x1b[0m`;
const ansi256Bg = (code: number, text: string) => `\x1b[48;5;${code}m${text}\x1b[0m`;

// ── Token estimation for individual messages ──────────────────────────

function estimateStringTokens(text: string): number {
	// ~4 chars per token, rough but consistent with pi's estimateTokens
	return Math.ceil(text.length / 4);
}

function estimateContentTokens(content: string | Array<{ type: string; [k: string]: any }>): number {
	if (typeof content === "string") return estimateStringTokens(content);
	let total = 0;
	for (const block of content) {
		if (block.type === "text") {
			total += estimateStringTokens(block.text ?? "");
		} else if (block.type === "image") {
			// Images are typically ~1600 tokens for a standard image
			total += 1600;
		}
	}
	return total;
}

// ── Breakdown computation ─────────────────────────────────────────────

interface ContextBreakdown {
	categories: Category[];
	totalTokens: number;
	contextWindow: number;
	percent: number | null;
	cacheRead: number;
	cacheWrite: number;
	totalCost: number;
	messageCount: number;
	turnCount: number;
}

function computeBreakdown(ctx: any): ContextBreakdown | null {
	const usage: ContextUsage | undefined = ctx.getContextUsage();
	if (!usage) return null;

	const { contextWindow } = usage;
	const branch = ctx.sessionManager.getBranch();

	// Accumulators
	let systemPromptTokens = 0;
	let userTokens = 0;
	let assistantTextTokens = 0;
	let thinkingTokens = 0;
	let compactionTokens = 0;
	let customMessageTokens = 0;
	let imageTokens = 0;
	const toolTokens: Record<string, number> = {};
	let cacheRead = 0;
	let cacheWrite = 0;
	let totalCost = 0;
	let turnCount = 0;
	let messageCount = 0;

	// Estimate system prompt tokens
	try {
		const sysPrompt = ctx.getSystemPrompt();
		if (sysPrompt) {
			systemPromptTokens = estimateStringTokens(sysPrompt);
		}
	} catch {
		// May not be available outside of a turn
		systemPromptTokens = 0;
	}

	for (const entry of branch) {
		if (entry.type === "message") {
			const msg = entry.message;
			messageCount++;

			if (msg.role === "user") {
				const um = msg as UserMessage;
				const content = um.content;
				if (typeof content === "string") {
					userTokens += estimateStringTokens(content);
				} else if (Array.isArray(content)) {
					for (const block of content) {
						if (block.type === "text") {
							userTokens += estimateStringTokens(block.text);
						} else if (block.type === "image") {
							imageTokens += 1600;
						}
					}
				}
			} else if (msg.role === "assistant") {
				const am = msg as AssistantMessage;
				turnCount++;
				cacheRead += am.usage.cacheRead;
				cacheWrite += am.usage.cacheWrite;
				totalCost += am.usage.cost.total;

				for (const block of am.content) {
					if (block.type === "text") {
						assistantTextTokens += estimateStringTokens(block.text);
					} else if (block.type === "thinking") {
						// Thinking tokens are in the output but we estimate content size
						thinkingTokens += estimateStringTokens(block.thinking);
					}
					// ToolCall blocks: their tokens are small (function name + args JSON)
					if ((block as any).type === "tool_use" || (block as any).toolCallId) {
						assistantTextTokens += estimateStringTokens(
							JSON.stringify((block as any).arguments ?? {})
						);
					}
				}
			} else if (msg.role === "toolResult") {
				const tr = msg as ToolResultMessage;
				const name = tr.toolName || "unknown";
				const tokens = estimateContentTokens(tr.content);
				toolTokens[name] = (toolTokens[name] ?? 0) + tokens;
			}
		} else if (entry.type === "compaction") {
			compactionTokens += estimateStringTokens(entry.summary ?? "");
		} else if (entry.type === "custom_message") {
			const content = entry.content;
			if (typeof content === "string") {
				customMessageTokens += estimateStringTokens(content);
			} else if (Array.isArray(content)) {
				customMessageTokens += estimateContentTokens(content);
			}
		} else if (entry.type === "branch_summary") {
			compactionTokens += estimateStringTokens(entry.summary ?? "");
		}
	}

	// Build categories list
	const categories: Category[] = [];

	const addCat = (
		key: string,
		label: string,
		tokens: number,
		color: (theme: Theme, text: string) => string,
		square: string,
	) => {
		if (tokens > 0) {
			categories.push({ key, label, tokens, color, square });
		}
	};

	addCat("system", "System Prompt", systemPromptTokens,
		(th, t) => ansi256Fg(141, t), ansi256Bg(141, "  ")); // Purple

	addCat("user", "User Messages", userTokens,
		(th, t) => ansi256Fg(75, t), ansi256Bg(75, "  ")); // Blue

	addCat("assistant", "Assistant Text", assistantTextTokens,
		(th, t) => ansi256Fg(114, t), ansi256Bg(114, "  ")); // Green

	addCat("thinking", "Thinking", thinkingTokens,
		(th, t) => ansi256Fg(216, t), ansi256Bg(216, "  ")); // Orange

	// Tool categories — sorted by tokens descending
	const builtinTools: Record<string, { label: string; colorCode: number }> = {
		read: { label: "Tool: read", colorCode: 73 },      // Teal
		bash: { label: "Tool: bash", colorCode: 167 },     // Red
		edit: { label: "Tool: edit", colorCode: 179 },     // Gold
		write: { label: "Tool: write", colorCode: 143 },   // Olive
		grep: { label: "Tool: grep", colorCode: 109 },     // Steel blue
		find: { label: "Tool: find", colorCode: 146 },     // Light purple
		ls: { label: "Tool: ls", colorCode: 108 },         // Sage
		subagent: { label: "Tool: subagent", colorCode: 175 }, // Pink
		web_search: { label: "Tool: web_search", colorCode: 74 },
		web_fetch: { label: "Tool: web_fetch", colorCode: 38 },
		ask_user_question: { label: "Tool: ask_user", colorCode: 183 },
		video_extract: { label: "Tool: video", colorCode: 204 },
		google_image_search: { label: "Tool: img_search", colorCode: 214 },
		youtube_search: { label: "Tool: yt_search", colorCode: 196 },
	};

	// Custom tool fallback colors
	const customToolColors = [132, 166, 130, 97, 136, 169, 103, 172];
	let customColorIdx = 0;

	const sortedTools = Object.entries(toolTokens).sort((a, b) => b[1] - a[1]);
	for (const [name, tokens] of sortedTools) {
		const builtin = builtinTools[name];
		const colorCode = builtin?.colorCode ?? customToolColors[customColorIdx++ % customToolColors.length]!;
		const label = builtin?.label ?? `Tool: ${name}`;
		addCat(`tool:${name}`, label, tokens,
			(_th, t) => ansi256Fg(colorCode, t), ansi256Bg(colorCode, "  "));
	}

	addCat("compaction", "Compaction", compactionTokens,
		(th, t) => ansi256Fg(245, t), ansi256Bg(245, "  ")); // Gray

	addCat("custom", "Custom Messages", customMessageTokens,
		(th, t) => ansi256Fg(183, t), ansi256Bg(183, "  ")); // Lavender

	addCat("images", "Images", imageTokens,
		(th, t) => ansi256Fg(219, t), ansi256Bg(219, "  ")); // Pink

	// Calculate used tokens from categories
	const usedFromCategories = categories.reduce((s, c) => s + c.tokens, 0);

	// Use the real context usage if available, otherwise use our estimate
	const totalTokens = usage.tokens ?? usedFromCategories;
	const freeTokens = Math.max(0, contextWindow - totalTokens);

	// Add free space
	categories.push({
		key: "free",
		label: "Free",
		tokens: freeTokens,
		color: (_th, t) => ansi256Fg(240, t),
		square: ansi256Bg(236, "  "), // Dark gray
	});

	return {
		categories,
		totalTokens,
		contextWindow,
		percent: usage.percent,
		cacheRead,
		cacheWrite,
		totalCost,
		messageCount,
		turnCount,
	};
}

// ── Grid rendering ────────────────────────────────────────────────────

function renderGrid(
	breakdown: ContextBreakdown,
	width: number,
	theme: Theme,
): string[] {
	const lines: string[] = [];
	const squareW = 2; // Each grid cell is 2 chars wide
	const cols = Math.floor(width / squareW);
	if (cols <= 0) return lines;

	// Target ~10-15 rows of grid for good visual density
	const targetRows = Math.min(15, Math.max(6, Math.floor(width / 8)));
	const cellsTotal = cols * targetRows;
	const tokensPerCell = breakdown.contextWindow / cellsTotal;

	// Build cell array
	const cells: string[] = [];
	let cellIdx = 0;
	for (const cat of breakdown.categories) {
		const numCells = Math.max(
			cat.tokens > 0 && cat.key !== "free" ? 1 : 0,
			Math.round(cat.tokens / tokensPerCell),
		);
		for (let i = 0; i < numCells && cellIdx < cellsTotal; i++) {
			cells.push(cat.square);
			cellIdx++;
		}
	}
	// Fill remaining with free space
	while (cellIdx < cellsTotal) {
		const freeCat = breakdown.categories.find((c) => c.key === "free");
		cells.push(freeCat?.square ?? ansi256Bg(236, "  "));
		cellIdx++;
	}

	// Calculate grid width and centering padding
	const gridW = cols * squareW;
	const leftPad = Math.floor((width - gridW) / 2);
	const leftPadStr = leftPad > 0 ? " ".repeat(leftPad) : "";

	// Render grid rows
	for (let row = 0; row < targetRows; row++) {
		const start = row * cols;
		const end = Math.min(start + cols, cells.length);
		let line = leftPadStr;
		for (let i = start; i < end; i++) {
			line += cells[i];
		}
		lines.push(line);
	}

	return lines;
}

// ── Overlay component ─────────────────────────────────────────────────

function formatTokens(n: number): string {
	if (n >= 1_000_000) return `${(n / 1_000_000).toFixed(1)}M`;
	if (n >= 1_000) return `${(n / 1_000).toFixed(1)}k`;
	return `${n}`;
}

function buildOverlay(
	breakdown: ContextBreakdown,
	theme: Theme,
	width: number,
): string[] {
	const lines: string[] = [];
	const innerW = width - 2; // two border chars (│ on each side)

	const pad = (s: string, len: number) => {
		const vis = visibleWidth(s);
		return s + " ".repeat(Math.max(0, len - vis));
	};

	const row = (content: string) =>
		theme.fg("border", "│") + pad(` ${content}`, innerW) + theme.fg("border", "│");

	const emptyRow = () => row("");

	const hr = () =>
		theme.fg("border", "│") +
		theme.fg("dim", "─".repeat(innerW)) +
		theme.fg("border", "│");

	// Top border
	lines.push(theme.fg("border", `╭${"─".repeat(innerW)}╮`));

	// Title
	const pct = breakdown.percent !== null ? ` (${breakdown.percent.toFixed(1)}%)` : "";
	const titleText = `Context Window Usage${pct}`;
	lines.push(row(theme.bold(theme.fg("accent", titleText))));

	// Subtitle: model info
	const modelLine = `${formatTokens(breakdown.totalTokens)} / ${formatTokens(breakdown.contextWindow)} tokens`;
	lines.push(row(theme.fg("muted", modelLine)));

	lines.push(emptyRow());

	// Grid — render into innerW and wrap with borders
	const gridLines = renderGrid(breakdown, innerW, theme);
	for (const gl of gridLines) {
		lines.push(
			theme.fg("border", "│") +
			pad(gl, innerW) +
			theme.fg("border", "│"),
		);
	}

	lines.push(emptyRow());
	lines.push(hr());
	lines.push(emptyRow());

	// Legend — two columns
	const nonFreeCategories = breakdown.categories.filter((c) => c.key !== "free");
	const freeCat = breakdown.categories.find((c) => c.key === "free");

	// Calculate column layout: 1 leading space (from row/pad) + 1 extra + colW + colW + trailing
	const colW = Math.floor((innerW - 2) / 2);

	const formatEntry = (cat: Category, w: number): string => {
		const pctStr = ((cat.tokens / breakdown.contextWindow) * 100).toFixed(1);
		const label = `${cat.square} ${cat.color(theme, cat.label)}`;
		const value = theme.fg("dim", `${formatTokens(cat.tokens)} (${pctStr}%)`);
		const entry = `${label} ${value}`;
		return pad(entry, w);
	};

	for (let i = 0; i < nonFreeCategories.length; i += 2) {
		const left = nonFreeCategories[i]!;
		const right = nonFreeCategories[i + 1];

		let content = " " + formatEntry(left, colW);
		if (right) {
			content += formatEntry(right, colW);
		}
		lines.push(
			theme.fg("border", "│") +
			pad(content, innerW) +
			theme.fg("border", "│"),
		);
	}

	// Free space entry
	if (freeCat && freeCat.tokens > 0) {
		const pctStr = ((freeCat.tokens / breakdown.contextWindow) * 100).toFixed(1);
		const label = `${freeCat.square} ${freeCat.color(theme, freeCat.label)}`;
		const value = theme.fg("dim", `${formatTokens(freeCat.tokens)} (${pctStr}%)`);
		lines.push(row(`${label} ${value}`));
	}

	lines.push(emptyRow());
	lines.push(hr());
	lines.push(emptyRow());

	// Stats section — wrap items to fit innerW
	const stats = [
		`Turns: ${breakdown.turnCount}`,
		`Messages: ${breakdown.messageCount}`,
		`Cache read: ${formatTokens(breakdown.cacheRead)}`,
		`Cache write: ${formatTokens(breakdown.cacheWrite)}`,
		`Cost: $${breakdown.totalCost.toFixed(4)}`,
	];
	lines.push(row(theme.fg("accent", theme.bold("Session Stats"))));
	const sep = theme.fg("dim", "  │  ");
	const sepW = visibleWidth(sep);
	// Available content width: innerW minus the leading space added by row()
	const contentW = innerW - 1;
	let currentLine = "";
	let currentW = 0;
	for (let i = 0; i < stats.length; i++) {
		const item = theme.fg("muted", stats[i]!);
		const itemW = visibleWidth(item);
		const needsSep = currentW > 0;
		const addW = (needsSep ? sepW : 0) + itemW;
		if (currentW > 0 && currentW + addW > contentW) {
			// Flush current line and start a new one
			lines.push(row(currentLine));
			currentLine = item;
			currentW = itemW;
		} else {
			currentLine += (needsSep ? sep : "") + item;
			currentW += addW;
		}
	}
	if (currentLine) lines.push(row(currentLine));

	// Warnings / suggestions
	const suggestions: string[] = [];
	if (breakdown.percent !== null && breakdown.percent > 80) {
		suggestions.push("⚠ Context usage above 80% — consider /compact");
	}
	if (breakdown.percent !== null && breakdown.percent > 95) {
		suggestions.push("🔴 Near context limit — compaction strongly recommended");
	}

	// Find biggest tool consumer
	const toolCats = breakdown.categories.filter((c) => c.key.startsWith("tool:"));
	const biggestTool = toolCats.sort((a, b) => b.tokens - a.tokens)[0];
	if (biggestTool && biggestTool.tokens > breakdown.contextWindow * 0.2) {
		const pct = ((biggestTool.tokens / breakdown.contextWindow) * 100).toFixed(0);
		suggestions.push(
			`💡 ${biggestTool.label} uses ${pct}% of context — consider summarizing large outputs`,
		);
	}

	if (suggestions.length > 0) {
		lines.push(emptyRow());
		lines.push(hr());
		lines.push(emptyRow());
		for (const s of suggestions) {
			lines.push(row(theme.fg("warning", s)));
		}
	}

	lines.push(emptyRow());

	// Help
	lines.push(row(theme.fg("dim", "Press Escape to close")));

	// Bottom border
	lines.push(theme.fg("border", `╰${"─".repeat(innerW)}╯`));

	return lines;
}

// ── Extension entry point ─────────────────────────────────────────────

export default function (pi: ExtensionAPI) {
	pi.registerCommand("context", {
		description: "Visualize current context usage as a colored grid",
		handler: async (_args: string, ctx: ExtensionCommandContext) => {
			const breakdown = computeBreakdown(ctx);
			if (!breakdown) {
				ctx.ui.notify("No context usage data available yet. Send a message first.", "warning");
				return;
			}

			await ctx.ui.custom<void>(
				(tui, theme, _keybindings, done) => {
					const cachedBreakdown = breakdown;

					return {
						handleInput(data: string) {
							if (matchesKey(data, "escape") || matchesKey(data, "q") || matchesKey(data, "return")) {
								done(undefined);
							}
						},

						render(width: number): string[] {
							return buildOverlay(cachedBreakdown, theme, width);
						},

						invalidate() {},
					};
				},
				{
					overlay: true,
					overlayOptions: {
						anchor: "center",
						width: "80%",
						maxWidth: 100,
						minWidth: 40,
						maxHeight: "90%",
					},
				},
			);
		},
	});
}
