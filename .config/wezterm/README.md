# WezTerm Configuration (`.config/wezterm`)

This folder contains configuration for [WezTerm](https://wezfurlong.org/wezterm/), a GPU-accelerated terminal emulator.

## Main File

- `wezterm.lua`: Main configuration file (in Lua).

## Key Features

- **Custom Key Bindings**: All default key bindings are disabled so you can define your own.
- **Leader Key**: `Ctrl+a` is set as the leader for custom sequences.
- **Pane & Tab Management**:
  - `Ctrl+1` to `Ctrl+9`: Switch to tabs 1–9
  - `Cmd+d`: Split pane horizontally
  - `Cmd+f`: Split pane vertically
  - `Ctrl+x`: Close current pane
  - `Ctrl+h/j/k/l`: Navigate between panes (vim-style)
- **Clipboard**:
  - `Ctrl+C`: Copy to clipboard
  - (Paste from clipboard is also mapped)

## Example Key Bindings

- `Ctrl+a` — Leader key for custom actions
- `Ctrl+1`–`Ctrl+9` — Switch tabs
- `Cmd+d` — Split pane horizontally
- `Cmd+f` — Split pane vertically
- `Ctrl+h/j/k/l` — Move between panes

## Usage

- Launch WezTerm and it will use this configuration.
- Edit `wezterm.lua` to tweak appearance or keymaps.

---

**Tip:** See the [WezTerm documentation](https://wezfurlong.org/wezterm/config/) for all available options and key bindings!
