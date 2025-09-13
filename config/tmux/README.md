# Tmux Configuration (`.config/tmux`)

This folder contains configuration for [tmux](https://github.com/tmux/tmux), the terminal multiplexer.

## Main File

- `tmux.conf`: Main configuration file for tmux.

## Key Features

- **Prefix Key**: Changed from `Ctrl+b` to `Ctrl+a` for easier access.
- **Vi Mode**: Enables vi-style navigation and copy mode.
- **Pane & Window Management**:
  - Split panes: `|` (horizontal), `-` (vertical)
  - Switch panes: `Alt+Arrow`
  - Resize panes: `Prefix + Arrow`
- **Copy Mode**:
  - `v` to begin selection
  - `y` to copy selection
- **Status Bar**: Custom status bar with session, host, and time.
- **Mouse Support**: Enabled for easier pane and window management.
- **Reload Config**: `Prefix + r` reloads the config file.

## Example Key Bindings

- `Ctrl+a |` — Split pane horizontally
- `Ctrl+a -` — Split pane vertically
- `Alt+Arrow` — Switch panes without prefix
- `Ctrl+a r` — Reload config
- `v` (in copy mode) — Begin selection
- `y` (in copy mode) — Copy selection

## Usage

- Start tmux: `tmux`
- All keymaps and options are in `tmux.conf`. Tweak as needed!

---

**Tip:** See the [tmux cheat sheet](https://tmuxcheatsheet.com/) for more shortcuts and ideas.
