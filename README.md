# Dotfiles

Personal dev configs.

## Install

```bash
git clone https://github.com/prdai/dotfiles.git ~/.dotfiles

# Shell
ln -sf ~/.dotfiles/config/bash/bashrc ~/.bashrc          # Linux / bash
ln -sf ~/.dotfiles/config/zshrc/.zshrc ~/.zshrc           # macOS / zsh

# Editors & tools
ln -sf ~/.dotfiles/config/nvim ~/.config/
ln -sf ~/.dotfiles/config/lazygit ~/.config/
ln -sf ~/.dotfiles/config/.idea/.ideavimrc ~/.ideavimrc
ln -sf ~/.dotfiles/config/.idea/.editorconfig ~/.editorconfig

# Terminals
ln -sf ~/.dotfiles/config/ghostty ~/.config/
ln -sf ~/.dotfiles/config/kitty ~/.config/

# Multiplexer
ln -sf ~/.dotfiles/config/tmux ~/.config/

# Window manager (macOS)
ln -sf ~/.dotfiles/config/aerospace ~/.config/

# Git
ln -sf ~/.dotfiles/config/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/config/git/ignore ~/.config/git/ignore

# Fish shell
ln -sf ~/.dotfiles/config/fish ~/.config/

# Reload
source ~/.bashrc   # or: source ~/.zshrc
```

## What's Inside

| Config | Description |
|--------|-------------|
| **bash** | Shell aliases, functions, custom prompt (Linux) |
| **zshrc** | Shell aliases, functions, custom prompt (macOS) |
| **fish** | Fish shell env variables |
| **nvim** | Neovim with LSP, Telescope, Harpoon, LazyGit |
| **ghostty** | Main terminal emulator |
| **kitty** | Alternative terminal emulator |
| **tmux** | Terminal multiplexer |
| **lazygit** | Git TUI with nvim integration |
| **git** | Global gitconfig and global gitignore |
| **aerospace** | Tiling window manager (macOS) |
| **.idea** | IdeaVim config for JetBrains IDEs |
| **.vscode** | VSCode Vim keybindings and editor settings |

> **Note:** WezTerm config is no longer maintained. Using Ghostty now.

Check `config/*/README.md` for details.