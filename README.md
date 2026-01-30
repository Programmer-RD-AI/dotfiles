# Dotfiles

Personal dev configs.

## Install

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles

# Link configs
ln -sf ~/.dotfiles/config/bash/bashrc ~/.bashrc
ln -sf ~/.dotfiles/config/nvim ~/.config/
ln -sf ~/.dotfiles/config/ghostty ~/.config/
ln -sf ~/.dotfiles/config/tmux ~/.config/
ln -sf ~/.dotfiles/config/lazygit ~/.config/

# Reload
source ~/.bashrc
```

## What's Inside

**Core Tools**
- **nvim** - Editor with LSP
- **bash** - Shell aliases and functions
- **ghostty** - Terminal (main one)
- **tmux** - Terminal multiplexer
- **lazygit** - Git UI

**Window Management**
- **aerospace** - macOS window manager

**Other Shells**
- **ohmyzsh** - Zsh config
- **fish** - Fish shell

**Editors**
- **.vscode** - VS Code with vim
- **.idea** - IntelliJ with vim

**Legacy**
- **wezterm** - Old terminal (not maintained)
- **kitty** - Alternative terminal

> Check `config/*/README.md` for keybindings and details.