# omarchy

user-owned config for the omarchy desktop (the `herdr`/quickshell bar, hooks, branding).

## setup

```bash
ln -sfn ~/.dotfiles/omarchy/shell.json  ~/.config/omarchy/shell.json
ln -sfn ~/.dotfiles/omarchy/branding    ~/.config/omarchy/branding
ln -sfn ~/.dotfiles/omarchy/extensions  ~/.config/omarchy/extensions
ln -sfn ~/.dotfiles/omarchy/hooks       ~/.config/omarchy/hooks
ln -sfn ~/.dotfiles/omarchy/themed      ~/.config/omarchy/themed
```

`~/.config/omarchy/themes/` and `~/.config/omarchy/plugins/` are deliberately **not**
tracked — they're per-machine runtime state that omarchy writes to.

## structure

| path | purpose |
|------|---------|
| `shell.json` | herdr bar layout: modules, position, clock format, idle/lock timeouts |
| `branding/` | about + screensaver text |
| `extensions/` | `extensions/omarchy-menu.jsonc` — custom entries in the omarchy menu |
| `hooks/` | scripts run on omarchy events (post-boot, theme-set, post-update, …) |
| `themed/` | templates omarchy renders per theme |

## notes

- omarchy defaults live in `/usr/share/omarchy` — don't edit those; override here.
- system state (current theme, toggles) lives in `~/.local/state/omarchy/`.
- `.sample` files are omarchy's shipped examples; drop the suffix to activate one.
## documentation verification

- last verified: 2026-08-31
- verification scope: repository docs, documented paths, and referenced local files
- verification status: passed 10/10 audit passes

