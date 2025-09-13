# Kitty Terminal Configuration (`.config/kitty`)

This folder contains configuration for the [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator.

## Main File

- `kitty.conf`: Main configuration file for Kitty.

## Key Features

- **Font & Appearance**: Set your preferred font, size, and color scheme.
- **Key Bindings**: Customize shortcuts for pane management, tab navigation, and more.
- **URL Handling**: Configure how URLs are detected and opened.
- **Tab Bar**: Style and behavior of the tab bar.

## Example Key Bindings

Add custom keymaps in `kitty.conf` like:

```conf
map ctrl+shift+enter new_window
map ctrl+shift+t new_tab
map ctrl+shift+left previous_tab
map ctrl+shift+right next_tab
```

## Usage

- Launch Kitty and it will automatically use this configuration.
- Edit `kitty.conf` to tweak appearance or keymaps.

---

**Tip:** See the [Kitty documentation](https://sw.kovidgoyal.net/kitty/conf/) for all available options and key bindings!
