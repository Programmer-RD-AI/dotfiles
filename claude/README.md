# claude config

Personal [Claude Code](https://claude.com/claude-code) configuration — global instructions, skills, settings, and MCP servers. Ported from the [pi config](../pi) where compatible.

## Setup

```bash
cp claude/CLAUDE.md ~/.claude/CLAUDE.md
cp claude/settings.json ~/.claude/settings.json
cp -r claude/skills ~/.claude/skills
```

MCP servers (user scope, merged into `~/.claude.json` under `mcpServers`) are in `mcp-servers.json`. Replace the placeholder env values with real keys:

| Server | Key |
|---|---|
| `youtube-search` | `YOUTUBE_API_KEY` — YouTube Data API v3 |
| `google-image-search` | `API_KEY` + `SEARCH_ENGINE_ID` — Google Custom Search |

`youtube-transcript` needs no key.

Plugins are declared in `settings.json` (`enabledPlugins` + `extraKnownMarketplaces`) and install on first run, or manually:

```bash
claude plugin marketplace add ayghri/i-have-adhd
claude plugin install i-have-adhd@i-have-adhd
```

## What's inside

- `CLAUDE.md` — global agentic engineering rules (same rules as `pi/agent/AGENTS.md`)
- `settings.json` — model, theme, enabled plugins
- `skills/` — agent skills, mostly ported from `pi/agent/skills` plus installed extras
- `mcp-servers.json` — user-scope MCP servers (YouTube transcript/search, Google image search)

## What stays local

Never committed: `~/.claude/.credentials.json`, `~/.claude.json` (session state), `settings.local.json` (machine permissions), sessions, history, plugin caches.
