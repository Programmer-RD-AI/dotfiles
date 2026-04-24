# tmux

prefix: `Ctrl+Space`

## key bindings

**panes**
- `Ctrl+Space |` → Split vertical
- `Ctrl+Space -` → Split horizontal
- `Alt+Arrow` → Navigate (no prefix)
- `Ctrl+Space Arrow` → Resize

**copy mode**
- `Ctrl+Space [` → Enter copy mode
- `v` → Begin selection
- `y` → Copy and exit

**config**
- `Ctrl+Space r` → Reload config

## plugin key bindings

**tpm (plugin manager)**
- `Ctrl+Space I` → Install plugins
- `Ctrl+Space U` → Update plugins
- `Ctrl+Space Alt+u` → Uninstall removed plugins

**tmux-resurrect — save/restore sessions**
- `Ctrl+Space Ctrl-s` → Save session
- `Ctrl+Space Ctrl-r` → Restore session

**tmux-cowboy — process management**
- `Ctrl+Space *` → Kill current pane process (SIGKILL)

**tmux-fzf — fzf menu**
- `Ctrl+Space F` → Open fzf menu (sessions, windows, panes, processes, key bindings)

## features

- Vi keys
- Mouse support (smart scroll via tmux-mighty-scroll)
- 50k scrollback
- Windows start at 1
- Auto-renumber windows
- Prefix key highlighted in status bar (tmux-prefix-highlight)

## plugins

| plugin | description |
|--------|-------------|
| `tmux-sensible` | Sensible defaults |
| `tmux-mem-cpu-load` | CPU/memory in status bar |
| `tmux-resurrect` | Save/restore sessions — `Prefix+Ctrl-s` / `Prefix+Ctrl-r` |
| `tmux-continuum` | Auto-saves session every 15 min |
| `tmux-git-autofetch` | Auto-fetches git repos every 3 min |
| `tmux-autoreload` | Auto-reloads tmux.conf on file change (requires `entr`) |
| `tmux-cowboy` | Kill pane process — `Prefix+*` |
| `tmux-prefix-highlight` | Highlights prefix key in status bar |
| `tmux-fzf` | fzf menu for sessions/windows/panes/processes — `Prefix+F` |
| `tmux-mighty-scroll` | Smart mouse scroll (copy-mode when idle, passthrough when running) |
