# My Personal Dotfiles

A collection of my personal configuration files (dotfiles), carefully organized and managed with Git. The aim is to create a consistent and comfortable environment across different machines.

## Philosophy

These dotfiles are tailored to my workflow, prioritizing simplicity, efficiency, and a clean aesthetic. They are shared in the hope that they might be useful to others, or provide a starting point for your own configurations.

## Structure

This repository follows the XDG Base Directory Specification where possible, keeping the home directory tidy. Most configurations are located within the `.config` directory:

```text
dotfiles/
└── .config/
    ├── bash/       # Shell environment, aliases, and custom prompt
    │   └── bashrc
    ├── nvim/       # Neovim setup with Lua, plugins via lazy.nvim
    │   ├── init.lua
    │   ├── lazy-lock.json
    │   └── lua/
    ├── kitty/      # Kitty terminal emulator settings
    │   └── kitty.conf
    ├── tmux/       # Tmux (terminal multiplexer) configuration
    │   └── tmux.conf
    ├── git/        # Git aliases and user configuration
    │   └── .gitconfig
    ├── htop/       # htop process viewer settings
    │   └── htoprc
    └── lazygit/    # Lazygit TUI for Git commands
        └── config.yml
```

(Other application configs might be present as well)

## Installation

1. **Clone the repository:**
   It's generally a good practice to clone dotfiles into a dedicated directory like `~/.dotfiles`.

   ```bash
   # Example:
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   # Remember to replace "yourusername" with your actual username/repo!
   cd ~/.dotfiles
   ```

2. **Create symbolic links (symlinks):**
   Symlinking is how these configurations become active. The following commands link the files from this repository to their expected locations in your home directory.

   ```bash
   # For Bash (ensure you backup or remove your existing ~/.bashrc if needed)
   ln -sf ~/.dotfiles/.config/bash/bashrc ~/.bashrc

   # For other configurations within .config (ensure you backup or remove existing configs)
   # This command links the nvim, kitty, and tmux directories. Add other directories as needed.
   ln -sf ~/.dotfiles/.config/nvim ~/.config/
   ln -sf ~/.dotfiles/.config/kitty ~/.config/
   ln -sf ~/.dotfiles/.config/tmux ~/.config/
   ln -sf ~/.dotfiles/.config/git ~/.config/git # Git config often lives in ~/.config/git
   ln -sf ~/.dotfiles/.config/htop ~/.config/htop
   ln -sf ~/.dotfiles/.config/lazygit ~/.config/lazygit

   # If your .gitconfig is expected directly in ~, you might do:
   # ln -sf ~/.dotfiles/.config/git/.gitconfig ~/.gitconfig
   ```

   _Adjust the `ln -sf` commands based on your specific setup and which configurations you want to use._

## Configurations Overview

- **Bash (`.config/bash/bashrc`):**
  - Sets up `PATH`, environment variables.
  - Includes useful shell options (`autocd`, `cdspell`, `globstar`).
  - Defines a custom color-coded prompt.
- **Neovim (`.config/nvim/`):**
  - Modern Neovim setup primarily in Lua.
  - Plugin management via `lazy.nvim`.
  - Includes LSP integration, autocompletion, and various UI enhancements.
- **Kitty (`.config/kitty/kitty.conf`):**
  - Font (JetBrains Mono), size, and theme settings.
  - URL detection and tab bar styling.
- **Tmux (`.config/tmux/tmux.conf`):**
  - Terminal multiplexer setup with `Ctrl+a` as the prefix.
  - Vi mode for navigation and copy-pasting.
  - Custom status bar and pane controls.
- **Git (`.config/git/.gitconfig`):**
  - User details and common aliases (`co`, `br`, `ci`, `st`, `lg`).
- **htop (`.config/htop/htoprc`):**
  - Customized layout and display settings for the htop process viewer.
- **Lazygit (`.config/lazygit/config.yml`):**
  - Theme and editor settings for the Lazygit terminal UI for Git.

## Maintenance

1. Edit the configuration files directly within this cloned repository (`~/.dotfiles`).
2. Since they are symlinked, changes will take effect immediately (or upon restarting the relevant application).
3. Commit and push any changes to this repository to keep your dotfiles backed up and versioned.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
