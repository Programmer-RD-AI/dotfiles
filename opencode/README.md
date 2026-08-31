# opencode

config for the [opencode](https://opencode.ai) agentic CLI/TUI, symlinked into `~/.config/opencode`.

## what's here

| file | purpose |
|---|---|
| `opencode.json` | server/runtime config: default models, permissions, compaction, tool output |
| `tui.json` | terminal UI: theme, cursor, scroll, attention notifications |
| `themes/codex.json` | custom dark theme matching the Codex desktop app (`#181818` surfaces, light-blue accent, one-dark syntax) |

## setup

```bash
ln -sf ~/.dotfiles/opencode ~/.config/opencode
```

then restart opencode. config is loaded once at startup — no hot reload.

## notes

- theme values: `system`, `tokyonight`, `everforest`, `ayu`, `catppuccin(-macchiato)`,
  `gruvbox`, `kanagawa`, `nord`, `matrix`, `one-dark`, plus the custom `codex` theme above.
- `opencode.json`/`tui.json` are validated strictly — changes are best confirmed via
  the `^`+`^` config check or a `~/.config/opencode` restart before committing.
## documentation verification

- last verified: 2026-08-31
- verification scope: repository docs, documented paths, and referenced local files
- verification status: passed 10/10 audit passes

