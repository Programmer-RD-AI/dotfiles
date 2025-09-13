# WezTerm Configuration (`.config/wezterm`)

This folder contains configuration for [WezTerm](https://wezfurlong.org/wezterm/), a GPU-accelerated terminal emulator.

## Main File

- `wezterm.lua`: Main configuration file (in Lua).

## Key Features

- **Custom Key Bindings**: All default key bindings are disabled so you can define your own.
- **Leader Key**: `Ctrl+a` is set as the leader for custom sequences.
- **Pane & Tab Management**: Easy tab and pane creation, navigation, and closing.
- **Vim-style Navigation**: Move between panes using familiar vim-style keys.
- **Clipboard Integration**: Copy and paste with keyboard shortcuts.
- **Font Control**: Resize font on the fly for better readability.

## Complete Keybinding Reference

### Leader Key

- `Ctrl+a` — Leader key for custom actions (timeout: 1000ms)

### Tab Management

- `Ctrl+a t` — Create a new tab
- `Ctrl+a w` — Close current tab (with confirmation)
- `Ctrl+1` through `Ctrl+9` — Switch to tabs 1-9

### Pane Management

- `Ctrl+a \` — Split pane vertically (creates a new pane to the right)
- `Ctrl+a -` — Split pane horizontally (creates a new pane below)
- `Ctrl+a x` — Close current pane (with confirmation)

### Pane Navigation (Vim-style)

- `Ctrl+h` — Move to the pane on the left
- `Ctrl+j` — Move to the pane below
- `Ctrl+k` — Move to the pane above
- `Ctrl+l` — Move to the pane on the right

### Clipboard Operations

- `Ctrl+Shift+c` — Copy selected text to clipboard
- `Ctrl+Shift+v` — Paste from clipboard

### Font Size Adjustments

- `Ctrl+=` — Increase font size
- `Ctrl+-` — Decrease font size
- `Ctrl+0` — Reset font size to default (12.0)

## Appearance

- Dark theme with custom colors
- JetBrains Mono font at 12pt
- Custom tab bar with color indicators for active/inactive state
- Integration with system decorations

## Usage

- Launch WezTerm and it will use this configuration.
- Edit `wezterm.lua` to tweak appearance or keymaps.

---

**Tip:** See the [WezTerm documentation](https://wezfurlong.org/wezterm/config/) for all available options and key bindings!
