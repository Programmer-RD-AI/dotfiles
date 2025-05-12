# My Personal Dotfiles

A collection of my personal configuration files (dotfiles), carefully organized and managed with Git. The aim is to create a consistent and comfortable environment across different machines.

## Philosophy

These dotfiles are tailored to my workflow, prioritizing simplicity, efficiency, and a clean aesthetic. They are shared in the hope that they might be useful to others, or provide a starting point for your own configurations.

## Structure

This repository follows the XDG Base Directory Specification where possible, keeping the home directory tidy. Most configurations are located within the `.config` directory. The repository also includes scripts for setup and maintenance:

```text
dotfiles/
├── .config/
│   ├── bash/       # Shell environment, aliases, and custom prompt
│   │   └── bashrc
│   ├── nvim/       # Neovim setup with Lua, plugins via lazy.nvim
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   └── lua/
│   ├── kitty/      # Kitty terminal emulator settings
│   │   └── kitty.conf
│   ├── tmux/       # Tmux (terminal multiplexer) configuration
│   │   └── tmux.conf
│   ├── git/        # Git aliases and user configuration
│   │   └── .gitconfig
│   ├── htop/       # htop process viewer settings
│   │   └── htoprc
│   └── lazygit/    # Lazygit TUI for Git commands
│       └── config.yml
├── scripts/
│   ├── setup/      # Platform-specific setup scripts (macOS, Ubuntu, Windows)
│   │   ├── setup-mac-dev.sh
│   │   ├── setup-ubuntu-dev.sh
│   │   ├── setup-windows-dev.ps1
│   │   ├── setup-windows-dev.sh
│   │   ├── python_version.txt
│   │   ├── requirements.txt
│   │   └── system-packages.txt
│   └── refresh-dotfiles.sh # Script to refresh or update dotfiles (e.g., re-symlink)
├── LICENSE         # Apache License 2.0
└── README.md       # This file
```

(Other application configs might be present as well)

## Installation

1.  **Clone the repository:**
    It's generally a good practice to clone dotfiles into a dedicated directory like `~/.dotfiles`.

    ```bash
    # Example:
    git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
    # Remember to replace "yourusername" with your actual username/repo!
    cd ~/.dotfiles
    ```

2.  **Run Setup Scripts (Recommended):**
    Navigate to the `scripts/setup` directory and execute the appropriate script for your operating system. These scripts typically handle symlinking configurations and may install necessary dependencies or software.

    ```bash
    cd ~/.dotfiles/scripts/setup
    # For Ubuntu:
    # ./setup-ubuntu-dev.sh
    # For macOS:
    # ./setup-mac-dev.sh
    # For Windows (using Git Bash or WSL):
    # ./setup-windows-dev.sh
    # Or using PowerShell:
    # ./setup-windows-dev.ps1
    ```

    _Always review scripts from the internet before running them to understand the changes they will make to your system._

3.  **Create Symbolic Links (Manual Alternative):**
    If you prefer manual control, the setup scripts do not suit your needs, or you only want to link specific configurations, you can create symbolic links manually. The following commands link the files from this repository to their expected locations in your home directory.

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
4. The `scripts/refresh-dotfiles.sh` script might be available to help automate tasks like re-applying symlinks or other maintenance actions. Check its contents for usage.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
