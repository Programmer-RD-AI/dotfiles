# Dotfiles

Personal dev configs.

## Install

```bash
git clone https://github.com/prdai/dotfiles.git ~/.dotfiles

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
- **dconf** - GNOME desktop settings (Linux)

**Other Shells**
- **ohmyzsh** - Zsh config
- **fish** - Fish shell
- **zshrc** - Standalone zsh config

**Editors**
- **.vscode** - VS Code with vim
- **.idea** - IntelliJ with vim

**Other Tools**
- **git** - Git aliases and worktree commands
- **obsidian** - Obsidian vault vim keybindings

**Legacy**
- **wezterm** - Old terminal (not maintained)
- **kitty** - Alternative terminal

> Check `config/*/README.md` for keybindings and details.