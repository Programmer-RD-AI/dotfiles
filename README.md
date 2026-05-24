# dotfiles

my personal dev configs for Arch + macOS.

## setup

```bash
git clone https://github.com/prdai/dotfiles.git

# Shell
ln -sf ~/dotfiles/bash/bashrc ~/.bashrc                  # Arch Linux / bash
ln -sf ~/dotfiles/fish ~/.config/fish                    # Fish shell
ln -sf ~/dotfiles/zshrc/.zshrc ~/.zshrc                  # macOS / zsh

# Editors & tools
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/lazygit ~/.config/
ln -sf ~/dotfiles/.idea/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.idea/.editorconfig ~/.editorconfig

# Terminals
ln -sf ~/dotfiles/ghostty ~/.config/
ln -sf ~/dotfiles/kitty ~/.config/

# Multiplexer
ln -sf ~/dotfiles/tmux ~/.config/

# Window manager + bar (Arch)
ln -sf ~/dotfiles/hypr ~/.config/
ln -sf ~/dotfiles/waybar ~/.config/

# Window manager (macOS)
ln -sf ~/dotfiles/aerospace ~/.config/

# Git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/ignore ~/.config/git/ignore

# Activity Monitor
ln -sf ~/dotfiles/btop ~/.config/

# Reload
source ~/.bashrc   # or: source ~/.zshrc
```

## what's inside

| Config | Description |
|--------|-------------|
| **bash** | Shell aliases, functions, custom prompt (Linux) |
| **fish** | Fish shell env variables |
| **zshrc** | Shell aliases, functions, custom prompt (macOS) |
| **nvim** | Neovim with LSP, Telescope, Harpoon, LazyGit |
| **ghostty** | Main terminal emulator |
| **kitty** | Alternative terminal emulator |
| **tmux** | Terminal multiplexer |
| **lazygit** | Git TUI with nvim integration |
| **git** | Global gitconfig and global gitignore |
| **hypr** | Hyprland compositor config (Arch) |
| **waybar** | Waybar status bar config (Arch) |
| **aerospace** | Tiling window manager (macOS) |
| **hypr** | Hyprland compositor config (Arch / Omarchy) — gaps, rounding, workspace anims, SUPER+TAB last-active |
| **waybar** | Status bar config — black pill theme, workspace window icons |
| **wallpapers** | Desktop wallpapers (applied via `swww` on Omarchy) |
| **.idea** | IdeaVim config for JetBrains IDEs |
| **.vscode** | VSCode Vim keybindings and editor settings |

> **note:** wezterm config is no longer maintained. using ghostty now.

check `*/README.md` for details.

for contribution workflow and docs tone, see [`CONTRIBUTING.md`](./CONTRIBUTING.md).
