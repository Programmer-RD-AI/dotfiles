# My Personal Dotfiles 🚀

A comprehensive collection of my personal configuration files (dotfiles), meticulously organized and managed with Git. These configurations are designed to create a consistent, efficient, and aesthetically pleasing development environment across different machines and operating systems.

## 🎯 Philosophy

These dotfiles embody a philosophy of **simplicity**, **efficiency**, and **consistency**. Every configuration choice is intentional, prioritizing:

- **Muscle Memory:** Consistent keybindings across all tools
- **Productivity:** Streamlined workflows and automation
- **Maintainability:** Clean, well-documented configurations
- **Portability:** Works seamlessly across Linux, macOS, and Windows
- **Modern Tools:** Leveraging the latest and greatest development tools

The configurations are shared not just as personal backup, but as inspiration and starting point for other developers seeking to optimize their development environment.

## 🏗️ Architecture & Structure

This repository follows the **XDG Base Directory Specification** where possible, keeping the home directory clean and organized. The structure is designed for clarity, modularity, and easy maintenance:

```text
dotfiles/
├── .config/                    # Main configuration directory (XDG compliant)
│   ├── bash/                  # Shell environment and customization
│   │   ├── bashrc             # Main bash configuration
│   │   └── README.md          # Bash setup documentation
│   ├── nvim/                  # Neovim configuration (Lua-based)
│   │   ├── init.lua           # Entry point
│   │   ├── lua/               # Modular Lua configurations
│   │   │   ├── options.lua    # Editor options
│   │   │   ├── keymaps.lua    # Custom keybindings
│   │   │   ├── plugins.lua    # Plugin management
│   │   │   ├── lsp.lua        # Language server setup
│   │   │   └── theme.lua      # Visual appearance
│   │   ├── lazy-lock.json     # Plugin version lockfile
│   │   └── README.md          # Comprehensive Neovim guide
│   ├── kitty/                 # Kitty terminal emulator
│   │   ├── kitty.conf         # Terminal configuration
│   │   └── README.md          # Kitty customization guide
│   ├── wezterm/               # WezTerm terminal emulator
│   │   ├── wezterm.lua        # Terminal configuration
│   │   └── README.md          # WezTerm setup guide
│   ├── tmux/                  # Terminal multiplexer
│   │   ├── tmux.conf          # Tmux configuration
│   │   └── README.md          # Tmux workflow guide
│   ├── git/                   # Git version control
│   │   ├── .gitconfig         # Git aliases and settings
│   │   └── README.md          # Git workflow documentation
│   ├── .vscode/               # VS Code IDE settings
│   │   ├── settings.json      # Editor preferences with Vim integration
│   │   └── README.md          # VS Code configuration guide
│   ├── .idea/                 # JetBrains IDEs configuration
│   │   ├── .ideavimrc         # Vim emulation in IntelliJ
│   │   └── README.md          # IntelliJ setup guide
│   ├── htop/                  # System process viewer
│   │   ├── htoprc             # Process viewer customization
│   │   └── README.md          # htop configuration guide
│   └── lazygit/               # Git terminal UI
│       ├── config.yml         # LazyGit customization
│       └── README.md          # LazyGit workflow guide
├── scripts/                   # Automation and setup scripts
│   ├── setup/                 # Platform-specific setup scripts
│   │   ├── setup-mac-dev.sh   # macOS development environment
│   │   ├── setup-ubuntu-dev.sh # Ubuntu development environment
│   │   ├── setup-windows-dev.ps1 # Windows PowerShell setup
│   │   ├── setup-windows-dev.sh  # Windows WSL setup
│   │   ├── python_version.txt # Python version specification
│   │   ├── requirements.txt   # Python package requirements
│   │   ├── system-packages.txt # System package list
│   │   └── README.md          # Comprehensive setup guide
│   └── refresh-dotfiles.sh    # Maintenance and update script
├── LICENSE                    # Apache License 2.0
└── README.md                  # This comprehensive guide
```

## 🚀 Installation & Setup

### Method 1: Automated Setup (Recommended)

The easiest way to get started is using the automated setup scripts:

```bash
# Clone the repository to a dedicated location
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Navigate to setup scripts
cd scripts/setup

# Choose your platform and run the appropriate script:

# For Ubuntu/Linux:
chmod +x setup-ubuntu-dev.sh
./setup-ubuntu-dev.sh

# For macOS:
chmod +x setup-mac-dev.sh
./setup-mac-dev.sh

# For Windows (in PowerShell as Administrator):
.\setup-windows-dev.ps1

# For Windows (in WSL/Git Bash):
chmod +x setup-windows-dev.sh
./setup-windows-dev.sh
```

**What the setup scripts do:**

- Install essential development tools and applications
- Create symbolic links for all configuration files
- Set up package managers (Homebrew, Chocolatey, APT)
- Configure shell environment with custom aliases and functions
- Install and configure Neovim with plugins
- Set up Git with useful aliases and configurations

### Method 2: Manual Installation

For those who prefer granular control or want to understand each step:

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 2. Backup existing configurations (important!)
mkdir -p ~/.config/backup
cp ~/.bashrc ~/.config/backup/ 2>/dev/null || true
cp -r ~/.config/nvim ~/.config/backup/ 2>/dev/null || true
cp -r ~/.config/kitty ~/.config/backup/ 2>/dev/null || true

# 3. Create symbolic links for core configurations
ln -sf ~/.dotfiles/.config/bash/bashrc ~/.bashrc
ln -sf ~/.dotfiles/.config/nvim ~/.config/
ln -sf ~/.dotfiles/.config/kitty ~/.config/
ln -sf ~/.dotfiles/.config/wezterm ~/.config/
ln -sf ~/.dotfiles/.config/tmux ~/.config/
ln -sf ~/.dotfiles/.config/git ~/.config/
ln -sf ~/.dotfiles/.config/htop ~/.config/
ln -sf ~/.dotfiles/.config/lazygit ~/.config/

# 4. Create IDE-specific configurations
mkdir -p ~/.config/.vscode ~/.config/.idea
ln -sf ~/.dotfiles/.config/.vscode/settings.json ~/.config/.vscode/
ln -sf ~/.dotfiles/.config/.idea/.ideavimrc ~/.config/.idea/

# 5. Source the new bash configuration
source ~/.bashrc

# 6. Install Neovim plugins (if using Neovim)
nvim --headless +Lazy +qall
```

### Method 3: Selective Installation

Install only specific configurations you need:

```bash
# Clone repository
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles

# Link only Neovim configuration
ln -sf ~/.dotfiles/.config/nvim ~/.config/

# Link only terminal configurations
ln -sf ~/.dotfiles/.config/kitty ~/.config/
ln -sf ~/.dotfiles/.config/tmux ~/.config/

# Link only shell configuration
ln -sf ~/.dotfiles/.config/bash/bashrc ~/.bashrc
```

## ⚙️ Configuration Overview

### Shell Environment (Bash)

**Enhanced `.bashrc` Features:**

- **Smart PATH Management:** Automatically adds user binaries, Cargo, Anaconda, Node.js, and Snap to PATH
- **Color-Coded Prompt:** Shows Git status, current directory, user, and host with visual indicators
- **Productivity Aliases:** Common shortcuts for navigation, file operations, and development tasks
- **Git Integration:** Quick aliases for Git operations and status display
- **Interactive Features:** Only loads for interactive shells to optimize startup time

**Key Aliases:**

```bash
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Development
alias py='python3'
alias serve='python3 -m http.server'
alias activate='source venv/bin/activate'
```

### Neovim (Modern Text Editor)

**Comprehensive Lua Configuration:**

- **Plugin Manager:** lazy.nvim for efficient plugin management
- **LSP Integration:** Full Language Server Protocol support for 10+ languages
- **Advanced Completion:** Context-aware autocompletion with snippets
- **File Navigation:** nvim-tree explorer and Telescope fuzzy finder
- **Git Integration:** LazyGit terminal UI and git blame/diff
- **Productivity Features:** Harpoon for quick file switching, which-key for discoverability

**Language Support:**

- Python (pyright), JavaScript/TypeScript (tsserver), Go (gopls)
- Rust (rust_analyzer), Lua (lua_ls), HTML/CSS, JSON, YAML, Markdown

### Terminal Emulators

**Kitty Terminal:**

- **Performance:** GPU-accelerated rendering for smooth scrolling
- **Font Configuration:** JetBrains Mono with ligatures and icons
- **Color Scheme:** Carefully chosen dark theme with syntax highlighting
- **Window Management:** Tabs, splits, and session management
- **URL Handling:** Smart URL detection and opening

**WezTerm:**

- **Cross-Platform:** Consistent experience across Linux, macOS, Windows
- **Lua Configuration:** Powerful scripting for customization
- **Leader Key System:** Tmux-style navigation with Ctrl+a prefix
- **Multiplexing:** Built-in tab and pane management
- **Font Resizing:** Dynamic font size adjustment

### Terminal Multiplexer (Tmux)

**Advanced Session Management:**

- **Prefix Key:** Changed to Ctrl+a for easier access (closer to home row)
- **Vi Mode:** Vim-style navigation in copy mode
- **Smart Pane Management:** Intuitive splitting and resizing
- **Status Bar:** Custom status line with session info, host, and time
- **Mouse Support:** Modern mouse integration for pane selection
- **Session Persistence:** Maintains sessions across disconnections

### Git Configuration

**Productivity-Focused Git Setup:**

- **Meaningful Aliases:** Shortened commands for common operations
- **Enhanced Logging:** Beautiful, informative log formatting
- **Smart Defaults:** Sensible configuration for modern Git workflows
- **Editor Integration:** Seamless integration with Neovim
- **Merge Tools:** Configured diff and merge tools

**Key Git Aliases:**

```bash
co = checkout
br = branch
ci = commit
st = status
lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
```

### IDE Configurations

**VS Code with Vim Integration:**

- **Vim Extension:** Full Vim emulation with custom keybindings
- **Consistent Keymaps:** Matches Neovim keybindings for muscle memory
- **LSP Integration:** IntelliSense and debugging capabilities
- **Theme Consistency:** Matching color schemes across editors

**IntelliJ IDEA with IdeaVim:**

- **Complete Vim Emulation:** Advanced Vim features in JetBrains IDEs
- **Cross-Platform Keybindings:** Same shortcuts across Neovim, VS Code, and IntelliJ
- **IDE-Specific Features:** Database tools, debugging, and refactoring integration

## 🎮 Universal Keybinding System

One of the key features of this dotfiles setup is the **consistent keybinding system** across all editors and tools:

### Core Navigation (Works Everywhere)

- `<space>` — Universal leader key
- `gd`, `gr`, `gi` — LSP navigation (definition, references, implementation)
- `<leader>ff`, `<leader>fg` — File finding and grep search
- `<leader>ee`, `<leader>ef` — File explorer toggle and focus
- `<space>e`, `[d`, `]d` — Diagnostics and error navigation

### Split/Window Management

- `<leader>sv/sh` — Create vertical/horizontal splits
- `<C-h/j/k/l>` — Navigate between splits/panes (works with tmux!)
- `<leader>+/-/>/<` — Resize splits and panes

### File Operations

- `<leader>w` — Save file
- `<leader>y/p` — System clipboard operations
- `<leader>/` — Toggle comments

### Quick File Access

- **Neovim:** Harpoon (`<leader>ha`, `<leader>h1-4`)
- **VS Code:** Pinned tabs with same keybindings
- **IntelliJ:** Favorites system with consistent shortcuts

## 🔧 Maintenance & Updates

### Daily Maintenance

```bash
# Update all system packages (Ubuntu)
sudo apt update && sudo apt upgrade

# Update Homebrew packages (macOS)
brew update && brew upgrade

# Update Node.js packages globally
npm update -g

# Update Neovim plugins
nvim --headless +"Lazy update" +qall

# Refresh dotfiles (run from dotfiles directory)
./scripts/refresh-dotfiles.sh
```

### Weekly Maintenance

```bash
# Clean package caches
sudo apt autoremove && sudo apt autoclean  # Ubuntu
brew cleanup                               # macOS

# Update Python packages in virtual environments
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U

# Update Git repositories in development folders
find ~/dev -name ".git" -type d -execdir git pull \;
```

### Configuration Updates

**Making Changes:**

1. Edit configuration files directly in the `~/.dotfiles` repository
2. Changes take effect immediately due to symbolic linking
3. Test changes before committing
4. Commit and push to backup your configurations

**Adding New Configurations:**

```bash
# Add new application config
mkdir -p ~/.dotfiles/.config/newapp
ln -sf ~/.dotfiles/.config/newapp ~/.config/

# Document the new configuration
echo "# New App Configuration" > ~/.dotfiles/.config/newapp/README.md
```

## 🌐 Cross-Platform Compatibility

### Linux (Ubuntu/Debian)

- **Package Manager:** APT with PPA support
- **Terminal:** Kitty or WezTerm with true color support
- **Shell:** Bash with custom prompt and aliases
- **Compatibility:** Full feature support for all configurations

### macOS

- **Package Manager:** Homebrew for CLI tools and applications
- **Terminal:** iTerm2 or WezTerm for enhanced features
- **Shell:** Zsh (default) or Bash with custom configurations
- **Compatibility:** Full support with macOS-specific optimizations

### Windows

- **Subsystem:** WSL2 for Linux compatibility
- **Terminal:** Windows Terminal or WezTerm
- **Package Manager:** Chocolatey for Windows applications
- **Compatibility:** Full support through WSL2 and native Windows tools

## 🎯 Customization Guide

### Personal Customization

**Fork and Personalize:**

1. Fork this repository to your GitHub account
2. Update personal information in setup scripts
3. Modify color schemes and themes to your preference
4. Add your own aliases and functions
5. Customize keybindings for your workflow

**Environment Variables:**

```bash
# Add to ~/.config/bash/bashrc
export EDITOR="nvim"
export BROWSER="firefox"
export TERM="xterm-256color"
export DOTFILES="$HOME/.dotfiles"
```

**Custom Aliases:**

```bash
# Add personal aliases to ~/.config/bash/bashrc
alias work='cd ~/Documents/work'
alias personal='cd ~/Documents/personal'
alias dotfiles='cd ~/.dotfiles'
```

### Theme Customization

**Terminal Themes:**

- Modify color schemes in `kitty.conf` or `wezterm.lua`
- Choose from popular themes like Dracula, Gruvbox, or Nord
- Ensure consistency across all terminal applications

**Editor Themes:**

- Neovim themes in `lua/theme.lua`
- VS Code themes in `settings.json`
- Consistent color schemes across all editors

## 📊 Quick Reference

### Essential Commands

- **Reload shell:** `source ~/.bashrc`
- **Edit Neovim config:** `nvim ~/.config/nvim`
- **Update plugins:** `nvim +Lazy +Mason`
- **Git status:** `gs` (alias for `git status`)
- **New terminal:** `Ctrl+Shift+T` (most terminals)

### File Locations

- **Bash config:** `~/.dotfiles/.config/bash/bashrc`
- **Neovim config:** `~/.dotfiles/.config/nvim/`
- **Git config:** `~/.dotfiles/.config/git/.gitconfig`
- **Terminal configs:** `~/.dotfiles/.config/kitty/` or `~/.dotfiles/.config/wezterm/`

### Help & Documentation

- Each `.config/` subdirectory contains a comprehensive `README.md`
- Run `<leader>?` in Neovim for which-key help
- Use `man` pages for terminal tools: `man tmux`, `man git`
- Check application documentation: `:help` in Neovim, `git help <command>`

## 🤝 Contributing

**Feedback and Contributions Welcome!**

1. **Issues:** Report bugs or suggest improvements via GitHub issues
2. **Pull Requests:** Submit improvements with clear descriptions
3. **Discussions:** Share your own customizations and workflows
4. **Documentation:** Help improve these guides

**Contribution Guidelines:**

- Test changes on multiple platforms when possible
- Update relevant README.md files
- Follow existing code style and organization
- Document new features and configurations

## 📄 License

This project is licensed under the **Apache License 2.0** - see the [LICENSE](LICENSE) file for details.

**You are free to:**

- Use these configurations for personal or commercial purposes
- Modify and adapt to your needs
- Distribute and share with others

**Attribution appreciated but not required!**

---

## 🎉 Quick Reference to All Keymaps & Shortcuts

For detailed keybinding information for each tool, refer to their respective README.md files:

- **Bash:** Custom aliases and functions (`.config/bash/README.md`)
- **Neovim:** Comprehensive keymap system (`.config/nvim/README.md`)
- **Kitty:** Terminal shortcuts and features (`.config/kitty/README.md`)
- **WezTerm:** Leader-based terminal navigation (`.config/wezterm/README.md`)
- **Tmux:** Session and window management (`.config/tmux/README.md`)
- **LazyGit:** Git workflow shortcuts (`.config/lazygit/README.md`)
- **VS Code:** Vim integration keybindings (`.config/.vscode/README.md`)
- **IntelliJ:** IdeaVim configuration (`.config/.idea/README.md`)

## 🚀 Getting Started Checklist

- [ ] Clone repository to `~/.dotfiles`
- [ ] Run appropriate setup script for your platform
- [ ] Restart terminal or source `~/.bashrc`
- [ ] Open Neovim and let plugins install
- [ ] Test keybindings in different applications
- [ ] Customize themes and personal preferences
- [ ] Backup original configurations (if any)
- [ ] Read individual README.md files for detailed usage

**Welcome to a more productive development environment!** 🎯

---

**Tip:** Start with the automated setup script, then gradually customize each component to match your personal workflow and preferences!
