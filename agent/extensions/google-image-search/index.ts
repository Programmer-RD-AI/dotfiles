import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";
import { Type } from "typebox";
import * as fs from "node:fs";
import * as path from "node:path";

/**
 * Google Image Search Extension
 *
 * Registers a `google_image_search` tool that uses the Google Custom Search
 * JSON API to search for images and return structured metadata including
 * inline thumbnails for visual selection.
 *
 * Credentials: auth.json in this extension directory with
 * { "google_search_api_key": "...", "google_cse_id": "..." }
 */

const EXT_DIR = path.dirname(new URL(import.meta.url).pathname);
const AUTH_PATH = path.join(EXT_DIR, "auth.json");

function loadCredentials(): { apiKey: string; cseId: string } | null {
	const envApiKey = process.env.GOOGLE_SEARCH_API_KEY ?? process.env.GOOGLE_API_KEY;
	const envCseId = process.env.GOOGLE_CSE_ID ?? process.env.GOOGLE_CUSTOM_SEARCH_ENGINE_ID;
	if (envApiKey && envCseId) return { apiKey: envApiKey, cseId: envCseId };

	if (!fs.existsSync(AUTH_PATH)) return null;
	try {
		const config = JSON.parse(fs.readFileSync(AUTH_PATH, "utf-8"));
		const apiKey = config.google_search_api_key as string;
		const cseId = config.google_cse_id as string;
		if (apiKey && cseId) return { apiKey, cseId };
	} catch {}
	return null;
}
export default function activate(pi: ExtensionAPI) {
	pi.registerTool({
		name: "google_image_search",
		label: "Google Image Search",

		description:
			"Search Google Images using the Custom Search API. " +
			"Returns image URLs, inline thumbnails, titles, and source domains.",

		promptSnippet: "Search Google Images and return structured metadata (URL, thumbnail, title, source domain)",

		parameters: Type.Object({
			query: Type.String({
				description: "Image search query",
			}),
			max_results: Type.Optional(
				Type.Number({
					description: "Maximum number of results to return (1-10, default 5).",
					minimum: 1,
					maximum: 10,
				})
			),
		}),

		async execute(_toolCallId, params, _signal, _onUpdate, _ctx) {
			const query = params.query as string;
			const maxResults = Math.round(Math.min(Math.max((params.max_results as number | undefined) ?? 5, 1), 10));

			const creds = loadCredentials();
			if (!creds) {
				return {
					content: [{ type: "text", text: `Error: Missing Google Custom Search credentials. Set GOOGLE_SEARCH_API_KEY and GOOGLE_CSE_ID, or create ${AUTH_PATH} from auth.example.json. Get credentials from https://developers.google.com/custom-search/v1/introduction` }]
				};
			}
			const { apiKey, cseId } = creds;

			try {
				const results = await searchGoogleImages(query, maxResults, apiKey, cseId);
				if (results.length === 0) {
					return {
						content: [{ type: "text", text: `No images found for query: ${query}` }]
					};
				}

				// Fetch all thumbnails in parallel
				const thumbnails = await fetchThumbnails(results);

				// Build interleaved image + text content blocks
				const content: Array<{ type: "text"; text: string } | { type: "image"; data: string; mimeType: string }> = [];
				for (let i = 0; i < results.length; i++) {
					const r = results[i];
					const thumb = thumbnails[i];
					if (thumb) {
						content.push({ type: "image", data: thumb.data, mimeType: thumb.mimeType });
					}
					content.push({ type: "text", text: `[${i + 1}] Title: ${r.title}\nURL: ${r.url}\nSource: ${r.source_domain}` });
				}

				return {
					content,
					details: { results, query }
				};
			} catch (err: unknown) {
				const msg = err instanceof Error ? err.message : String(err);
				return {
					content: [{ type: "text", text: `Error: Google Image Search failed: ${msg}` }]
				};
			}
		},
	});
}

interface ImageResult {
	url: string;
	thumbnail_url: string;
	title: string;
	source_domain: string;
}

async function fetchThumbnails(
	results: ImageResult[],
): Promise<Array<{ data: string; mimeType: string } | null>> {
	return Promise.all(
		results.map(async (r) => {
			try {
				const resp = await fetch(r.thumbnail_url, {
					signal: AbortSignal.timeout(5000),
				});
				if (!resp.ok) return null;
				const contentType = resp.headers.get("content-type") || "";
				if (!contentType.startsWith("image/")) return null;
				const buf = Buffer.from(await resp.arrayBuffer());
				return { data: buf.toString("base64"), mimeType: contentType.split(";")[0] };
			} catch {
				return null;
			}
		}),
	);
}

async function searchGoogleImages(
	query: string,
	maxResults: number,
	apiKey: string,
	cseId: string
): Promise<ImageResult[]> {
	const num = Math.min(maxResults, 10);
	const url = new URL("https://www.googleapis.com/customsearch/v1");
	url.searchParams.set("key", apiKey);
	url.searchParams.set("cx", cseId);
	url.searchParams.set("q", query);
	url.searchParams.set("searchType", "image");
	url.searchParams.set("num", String(num));

	const resp = await fetch(url.toString());
	if (!resp.ok) {
		const body = await resp.text();
		throw new Error(`HTTP ${resp.status}: ${body.slice(0, 200)}`);
	}

	const data = (await resp.json()) as {
		items?: Array<{
			link: string;
			title: string;
			displayLink: string;
			image?: { thumbnailLink?: string };
		}>;
	};

	if (!data.items || data.items.length === 0) {
		return [];
	}

	return data.items.map((item) => ({
		url: item.link,
		thumbnail_url: item.image?.thumbnailLink ?? item.link,
		title: item.title,
		source_domain: item.displayLink,
	}));
}
