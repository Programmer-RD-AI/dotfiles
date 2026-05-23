# tmux

prefix: `Ctrl+Space`

## setup

**1. symlink the config**

```bash
ln -sf ~/.dotfiles/tmux ~/.config/
```

**2. clone tpm (plugin manager)**

```bash
git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/tmux/plugins/tpm
```

**3. start tmux and install plugins**

```bash
tmux
```

Then inside tmux:

```
Ctrl+Space I
```

That fetches and installs all plugins listed in `tmux.conf`. You should see each plugin clone into `~/.dotfiles/tmux/plugins/`.

**4. install `entr` (required for tmux-autoreload)**

```bash
# macOS
brew install entr

# Ubuntu / Debian
sudo apt install entr
```

`tmux-autoreload` uses `entr` to watch `tmux.conf` and reload it on save. Without it, the plugin won't fire but everything else still works.



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
| `tmux-cpu` | CPU/RAM icons + percentages in status bar (Nerd Font glyphs) |
| `tmux-resurrect` | Save/restore sessions — `Prefix+Ctrl-s` / `Prefix+Ctrl-r`. Auto-restore on tmux start. Captures pane contents and nvim sessions |
| `tmux-continuum` | Auto-saves session every 10 min |
| `tmux-git-autofetch` | Auto-fetches git repos every 3 min |
| `tmux-autoreload` | Auto-reloads tmux.conf on file change (requires `entr`) |
| `tmux-cowboy` | Kill pane process — `Prefix+*` |
| `tmux-prefix-highlight` | Highlights prefix key in status bar |
| `tmux-fzf` | fzf menu for sessions/windows/panes/processes — `Prefix+F` |
| `tmux-mighty-scroll` | Smart mouse scroll (copy-mode when idle, passthrough when running) |
