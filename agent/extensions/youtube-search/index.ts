/**
 * YouTube Search Extension
 *
 * Registers a `youtube_search` tool that uses yt-dlp to search YouTube
 * and return structured video metadata.
 *
 * Requirements: yt-dlp must be installed and in PATH.
 *   brew install yt-dlp   OR   pip install yt-dlp
 *
 * Placement: ~/.pi/agent/extensions/youtube-search/index.ts
 * Auto-discovered as a global extension in all pi sessions.
 */

import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";
import { StringEnum } from "@mariozechner/pi-ai";
import { Type } from "typebox";

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

/** Subset of fields we care about from a yt-dlp JSON line */
interface YtDlpVideo {
	id?: string;
	webpage_url?: string;
	title?: string;
	duration?: number;
	view_count?: number;
	upload_date?: string; // YYYYMMDD
	channel?: string;
	uploader?: string;
	thumbnail?: string;
}

/** Structured result returned to the LLM */
interface VideoResult {
	url: string;
	title: string;
	duration: number | null;
	duration_str: string;
	views: number | null;
	upload_date: string;
	channel: string;
	thumbnail: string;
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/**
 * Format duration in seconds as M:SS (< 1 hour) or H:MM:SS (≥ 1 hour).
 */
function formatDuration(seconds: number): string {
	if (!isFinite(seconds) || seconds < 0) return "?:??";
	const h = Math.floor(seconds / 3600);
	const m = Math.floor((seconds % 3600) / 60);
	const s = Math.floor(seconds % 60);
	if (h > 0) {
		return `${h}:${String(m).padStart(2, "0")}:${String(s).padStart(2, "0")}`;
	}
	return `${m}:${String(s).padStart(2, "0")}`;
}

/**
 * Reformat a yt-dlp upload_date string (YYYYMMDD) to ISO-style YYYY-MM-DD.
 * Returns the raw string unchanged if it is not exactly 8 characters.
 */
function reformatDate(raw: string): string {
	if (raw.length !== 8) return raw;
	return `${raw.slice(0, 4)}-${raw.slice(4, 6)}-${raw.slice(6, 8)}`;
}

/**
 * Compute a cutoff upload_date string in YYYYMMDD format.
 * Videos uploaded before this date are excluded when upload_date filtering is active.
 */
function getCutoffDateRaw(filter: "day" | "week" | "month" | "year"): string {
	const daysAgo = { day: 1, week: 7, month: 30, year: 365 }[filter];
	const cutoff = new Date();
	cutoff.setDate(cutoff.getDate() - daysAgo);
	const y = cutoff.getFullYear();
	const m = String(cutoff.getMonth() + 1).padStart(2, "0");
	const d = String(cutoff.getDate()).padStart(2, "0");
	return `${y}${m}${d}`;
}

/**
 * Map a raw yt-dlp JSON object to our clean VideoResult shape.
 */
function mapVideo(raw: YtDlpVideo): VideoResult {
	const id = raw.id ?? "";
	const url = raw.webpage_url ?? (id ? `https://www.youtube.com/watch?v=${id}` : "");
	const thumbnail = raw.thumbnail ?? (id ? `https://i.ytimg.com/vi/${id}/maxresdefault.jpg` : "");
	const duration = typeof raw.duration === "number" && raw.duration >= 0 ? raw.duration : null;

	return {
		url,
		title: raw.title ?? "(no title)",
		duration,
		duration_str: duration !== null ? formatDuration(duration) : "?:??",
		views: typeof raw.view_count === "number" ? raw.view_count : null,
		upload_date: raw.upload_date ? reformatDate(raw.upload_date) : "",
		channel: raw.channel ?? raw.uploader ?? "",
		thumbnail,
	};
}

/**
 * Build a human-readable text summary of results for the LLM message.
 */
function buildSummary(results: VideoResult[], query: string): string {
	if (results.length === 0) return `No results found for "${query}".`;

	const lines = results.map((v, i) => {
		const views = v.views !== null ? v.views.toLocaleString() : "?";
		return [
			`${i + 1}. ${v.title}`,
			`   URL:      ${v.url}`,
			`   Duration: ${v.duration_str}   Views: ${views}`,
			`   Channel:  ${v.channel || "?"}   Uploaded: ${v.upload_date || "?"}`,
		].join("\n");
	});

	return lines.join("\n\n");
}

// ---------------------------------------------------------------------------
// Extension entry point
// ---------------------------------------------------------------------------

export default function (pi: ExtensionAPI) {
	pi.registerTool({
		name: "youtube_search",
		label: "YouTube Search",

		description:
			"Search YouTube for videos using yt-dlp and return structured metadata. " +
			"Returns title, URL, duration, view count, channel, upload date, and thumbnail. " +
			"Supports optional filters for duration range and upload recency. " +
			"Requires yt-dlp to be installed (brew install yt-dlp).",

		promptSnippet: "Search YouTube videos and return structured metadata (title, URL, duration, views, thumbnail)",

		parameters: Type.Object({
			query: Type.String({
				description: "YouTube search query",
			}),

			max_results: Type.Optional(
				Type.Number({
					description: "Maximum number of results to return. Defaults to 5, maximum 20.",
					minimum: 1,
					maximum: 20,
				}),
			),

			min_duration: Type.Optional(
				Type.Number({
					description: "Minimum video duration in seconds. Applied client-side after fetching results.",
					minimum: 0,
				}),
			),

			max_duration: Type.Optional(
				Type.Number({
					description: "Maximum video duration in seconds. Applied client-side after fetching results.",
					minimum: 0,
				}),
			),

			upload_date: Type.Optional(
				StringEnum(["day", "week", "month", "year"] as const),
			),
		}),

		async execute(_toolCallId, params, signal, onUpdate, _ctx) {
			// Unpack and normalise parameters
			const query = params.query as string;
			const maxResults = Math.round(Math.min(Math.max((params.max_results as number | undefined) ?? 5, 1), 20));
			const minDuration = params.min_duration as number | undefined;
			const maxDuration = params.max_duration as number | undefined;
			const uploadDateFilter = params.upload_date as "day" | "week" | "month" | "year" | undefined;

			// Stream an early progress update so the user sees activity
			onUpdate?.({
				content: [
					{
						type: "text",
						text: `Searching YouTube for "${query}" (up to ${maxResults} results)…`,
					},
				],
			});

			// ---------------------------------------------------------------
			// Run yt-dlp
			// ---------------------------------------------------------------
			// ytsearchN:QUERY tells yt-dlp to perform a YouTube search for N results.
			// --dump-json  prints full video metadata as JSON (one object per line)
			//              and implies skipping the actual video download.
			// --no-download is an explicit redundant guard against downloading.
			const searchTarget = `ytsearch${maxResults}:${query}`;
			const args = ["--dump-json", "--no-download", searchTarget];

			let execResult: Awaited<ReturnType<typeof pi.exec>>;
			try {
				execResult = await pi.exec("yt-dlp", args, {
					signal,
					timeout: 30_000, // 30 second timeout
				});
			} catch (err) {
				const msg = err instanceof Error ? err.message : String(err);

				// Surface a clear message when yt-dlp is not installed
				if (msg.includes("ENOENT") || msg.includes("not found") || msg.includes("No such file")) {
					throw new Error(
						"yt-dlp is not installed or not in PATH.\n" +
							"Install it with:\n" +
							"  brew install yt-dlp\n" +
							"  OR: pip install yt-dlp",
					);
				}

				throw new Error(`yt-dlp execution failed: ${msg}`);
			}

			// Handle signal/timeout kill
			if (execResult.killed) {
				throw new Error("yt-dlp was killed (timed out or aborted). Try a more specific query or fewer results.");
			}

			// ---------------------------------------------------------------
			// Parse JSON output
			// ---------------------------------------------------------------
			const stdout = (execResult.stdout ?? "").trim();

			if (!stdout) {
				// Check stderr for a "command not found" signal
				const stderr = (execResult.stderr ?? "").toLowerCase();
				if (stderr.includes("command not found") || stderr.includes("not found")) {
					throw new Error(
						"yt-dlp is not installed or not in PATH.\n" +
							"Install it with:\n" +
							"  brew install yt-dlp\n" +
							"  OR: pip install yt-dlp",
					);
				}
				return {
					content: [{ type: "text", text: `No results found for "${query}".` }],
					details: { results: [], query, totalBeforeFilter: 0 },
				};
			}

			// Each line is an independent JSON object
			const rawLines = stdout.split("\n").filter((l) => l.trim().startsWith("{"));
			const videos: VideoResult[] = [];

			for (const line of rawLines) {
				try {
					const raw = JSON.parse(line) as YtDlpVideo;
					videos.push(mapVideo(raw));
				} catch {
					// Skip malformed / non-JSON lines silently
				}
			}

			// ---------------------------------------------------------------
			// Client-side filtering
			// ---------------------------------------------------------------
			let filtered = videos;

			// Duration range
			if (minDuration !== undefined) {
				filtered = filtered.filter((v) => v.duration !== null && v.duration >= minDuration);
			}
			if (maxDuration !== undefined) {
				filtered = filtered.filter((v) => v.duration !== null && v.duration <= maxDuration);
			}

			// Upload date recency
			if (uploadDateFilter) {
				const cutoff = getCutoffDateRaw(uploadDateFilter); // YYYYMMDD
				filtered = filtered.filter((v) => {
					if (!v.upload_date) return false;
					// v.upload_date is YYYY-MM-DD → strip dashes for lexicographic compare
					const norm = v.upload_date.replace(/-/g, "");
					return norm >= cutoff;
				});
			}

			// ---------------------------------------------------------------
			// Build response
			// ---------------------------------------------------------------
			if (filtered.length === 0) {
				const msg =
					videos.length > 0
						? `Found ${videos.length} result(s) for "${query}" but none passed the filters ` +
							`(min_duration=${minDuration ?? "—"}, max_duration=${maxDuration ?? "—"}, ` +
							`upload_date=${uploadDateFilter ?? "—"}).`
						: `No results found for "${query}".`;

				return {
					content: [{ type: "text", text: msg }],
					details: { results: [], query, totalBeforeFilter: videos.length },
				};
			}

			const summary = buildSummary(filtered, query);

			return {
				content: [
					{
						type: "text",
						text:
							`Found ${filtered.length} result(s) for "${query}"` +
							(filtered.length < videos.length ? ` (${videos.length} before filters)` : "") +
							`:\n\n${summary}`,
					},
				],
				details: {
					results: filtered,
					query,
					totalBeforeFilter: videos.length,
				},
			};
		},
	});
}
