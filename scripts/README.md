# scripts

small utility scripts used by this dotfiles setup.

## files

- `obsidian-sync.sh` → auto-commit/pull/push for `~/Documents/obsidian-vault` on login/logout.

## usage

```bash
~/.dotfiles/scripts/obsidian-sync.sh login
~/.dotfiles/scripts/obsidian-sync.sh logout
```

## omarchy-workspace-autostart.sh

Opens the standard app-per-workspace layout at login:

| workspace | app |
|-----------|-----|
| 1 | ghostty |
| 2 | zen-browser |
| 3 | obsidian |
| 4 | spotify |
| 5 | slack |

Wired up from `hypr/autostart.lua` via `o.exec_on_start()`, so it runs on every
Hyprland start. Safe to run by hand too:

```bash
~/.dotfiles/scripts/omarchy-workspace-autostart.sh
```

Apps already running are skipped (no duplicates on re-run), and apps that aren't
installed are skipped with a warning instead of failing the whole layout.

Edit the `LAYOUT` array at the top of the script to change the mapping.
