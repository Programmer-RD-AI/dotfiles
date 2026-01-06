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

- **bash** - Shell aliases and functions
- **nvim** - Editor with LSP
- **ghostty** - Terminal (main terminal now)
- **tmux** - Terminal multiplexer
- **lazygit** - Git UI

> **Note:** WezTerm config is no longer maintained. Using Ghostty now.

Check `config/*/README.md` for details.