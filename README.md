# Dotfiles

Personal configuration files for development environment.

## Install

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles

# Link configs
ln -sf ~/.dotfiles/config/bash/bashrc ~/.bashrc
ln -sf ~/.dotfiles/config/nvim ~/.config/
ln -sf ~/.dotfiles/config/kitty ~/.config/
ln -sf ~/.dotfiles/config/tmux ~/.config/
ln -sf ~/.dotfiles/config/lazygit ~/.config/
ln -sf ~/.dotfiles/config/wezterm ~/.config/

# Reload shell
source ~/.bashrc
```

## What's Inside

- **bash** - Shell aliases and functions
- **nvim** - Editor with LSP (Python, JS/TS, Go, Rust, Lua)
- **kitty/wezterm** - Terminal emulators
- **tmux** - Terminal multiplexer (`Ctrl+a` prefix)
- **lazygit** - Git UI

## Key Bindings

Leader key: `<space>`

Check each `config/*/README.md` for specific keybindings.