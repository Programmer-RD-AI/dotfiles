# Environment Setup Scripts

This repository contains automated setup scripts for configuring development environments across different operating systems (Ubuntu/Linux, macOS, and Windows). These scripts automate the installation and configuration of common development tools, programming languages, and productivity applications.

## 🚀 Quick Start

Choose the appropriate script based on your operating system:

### Ubuntu/Linux

```bash
chmod +x ubuntu-setup.sh
./ubuntu-setup.sh
```

### macOS

```bash
chmod +x macos-setup.sh
./macos-setup.sh
```

### Windows

PowerShell (Run as Administrator):

```powershell
.\windows-setup.ps1
```

Bash/WSL version:

```bash
chmod +x windows-setup.sh
./windows-setup.sh
```

## 📋 Prerequisites

### All Platforms

- Stable internet connection for downloading packages
- Administrator/sudo privileges
- At least 5GB free disk space
- Git installed (most scripts will install it if missing)

### Ubuntu/Linux Specific

- Ubuntu 20.04 LTS or newer (tested on 22.04 LTS)
- `curl` and `wget` (usually pre-installed)
- APT package manager

### macOS Specific

- macOS 10.15 (Catalina) or newer
- Xcode Command Line Tools (script will prompt to install)
- Terminal with bash or zsh

### Windows Specific

- Windows 10 version 1903 or newer
- PowerShell 5.1 or newer (for .ps1 script)
- WSL2 enabled (for .sh script)
- Administrative privileges

## 📦 What Gets Installed

### Core Development Tools (All Platforms)

**Programming Languages & Runtimes:**

- **Python 3.9+** with pip, virtual environment support
- **Node.js LTS** with npm and yarn package managers
- **Git** with enhanced configuration and aliases

**Editors & IDEs:**

- **Visual Studio Code** with essential extensions
- **Neovim** with custom Lua configuration from [nvim-config repository](https://github.com/Programmer-RD-AI/nvim-config.git)

**Containerization & Virtualization:**

- **Docker** with Docker Compose
- **Docker Desktop** (macOS/Windows)

**Data Science & Analysis:**

- **Anaconda** distribution with Jupyter, NumPy, Pandas, Matplotlib
- **Miniconda** (lightweight alternative option)

### Productivity Applications

**Communication & Collaboration:**

- **Notion** for note-taking and project management
- **Spotify** for background music while coding
- **GitHub Desktop** for visual Git operations

**Development Tools:**

- **Postman** for API testing and development
- **StarUML** for system design and modeling
- **Warp Terminal** (modern terminal with AI features)

**Web Browsers:**

- **Google Chrome** with developer tools

### Platform-Specific Installations

#### Ubuntu/Linux

**System Tools:**

- **Build essentials** (`gcc`, `make`, `cmake`)
- **NVIDIA drivers** (if NVIDIA GPU detected)
- **APT package management** tools and repositories
- **Snap packages** support
- **Flatpak** for additional app distribution

**Development Libraries:**

- **libssl-dev**, **libffi-dev** for Python packages
- **sqlite3** for database development
- **tree**, **htop**, **neofetch** for system monitoring

**Custom Configurations:**

- Enhanced `.bashrc` with custom aliases and functions
- Git configuration with user-friendly aliases
- Shell prompt customization with Git status

#### macOS

**Package Manager:**

- **Homebrew** with essential formulae and casks
- **Homebrew Cask** for GUI applications

**Development Tools:**

- **Xcode Command Line Tools**
- **CUDA toolkit** (if NVIDIA GPU present)
- **macOS-specific** development headers

**System Enhancements:**

- **iTerm2** terminal emulator
- **Rectangle** window management
- **Karabiner-Elements** for keyboard customization

#### Windows

**Package Managers:**

- **Chocolatey** for Windows package management
- **Scoop** for portable applications
- **Windows Package Manager** (winget)

**WSL Setup:**

- **Windows Subsystem for Linux** (WSL2)
- **Ubuntu** distribution for WSL
- **Windows Terminal** with custom profiles

**Development Environment:**

- **NVIDIA drivers** and CUDA toolkit
- **Windows-specific** development tools
- **PowerShell modules** for enhanced scripting

## 🔧 Configuration Details

### Shell Environment

**Bash Configuration (`~/.bashrc`):**

```bash
# Custom aliases for productivity
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Development shortcuts
alias py='python3'
alias pip='pip3'
alias serve='python3 -m http.server'
alias activate='source venv/bin/activate'
```

**Environment Variables:**

- `$EDITOR` set to `nvim`
- `$BROWSER` set to system default
- `$TERM` configured for true color support
- Python path optimization

### Git Configuration

**Global Git Settings:**

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
git config --global core.editor nvim
git config --global merge.tool vimdiff
```

**Useful Git Aliases:**

- `git co` → `git checkout`
- `git br` → `git branch`
- `git ci` → `git commit`
- `git st` → `git status`
- `git lg` → `git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit`

### Neovim Setup

The scripts automatically clone and configure a comprehensive Neovim setup:

**Features Installed:**

- **Plugin Manager:** lazy.nvim for efficient plugin management
- **LSP Support:** Language servers for Python, JavaScript, TypeScript, Go, Rust
- **Autocompletion:** Advanced completion with nvim-cmp
- **File Explorer:** nvim-tree for project navigation
- **Fuzzy Finder:** Telescope for searching files, buffers, and symbols
- **Git Integration:** LazyGit terminal UI
- **Syntax Highlighting:** Tree-sitter for superior code highlighting

**Custom Keybindings:** (See `.config/nvim/README.md` for complete reference)

### VS Code Extensions

**Automatically Installed Extensions:**

- **Language Support:** Python, JavaScript/TypeScript, Go, Rust
- **Git Integration:** GitLens, Git Graph
- **Productivity:** Vim extension, Bracket Pair Colorizer
- **Themes:** Material Theme, Dracula Theme
- **Debugging:** Python Debugger, Node.js Debugger

## 🔄 Post-Installation Steps

### 1. Verify Installations

```bash
# Check installed versions
python3 --version
node --version
git --version
docker --version
nvim --version
code --version
```

### 2. Configure Development Environment

**Python Development:**

```bash
# Create virtual environment
python3 -m venv ~/.venv/default
source ~/.venv/default/bin/activate
pip install --upgrade pip setuptools wheel
```

**Node.js Development:**

```bash
# Install global packages
npm install -g typescript eslint prettier nodemon
```

**Docker Setup:**

```bash
# Test Docker installation
docker --version
docker run hello-world
```

### 3. Customize Configurations

**Personal Git Configuration:**

```bash
git config --global user.name "Your Full Name"
git config --global user.email "your.email@example.com"
```

**SSH Key Generation:**

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## 🔄 Updating Installed Packages

### Ubuntu/Linux

```bash
# Update package lists and upgrade system
sudo apt update && sudo apt upgrade -y

# Update snap packages
sudo snap refresh

# Update Python packages
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
```

### macOS

```bash
# Update Homebrew and packages
brew update && brew upgrade

# Update Mac App Store apps
mas upgrade

# Update Node.js packages
npm update -g
```

### Windows

```powershell
# Update Chocolatey packages
choco upgrade all -y

# Update Scoop packages
scoop update *

# Update Windows packages
winget upgrade --all
```

## 🛠️ Troubleshooting

### Common Issues

**Permission Denied Errors:**

```bash
# Make script executable
chmod +x setup-script.sh

# Run with sudo if needed (Linux/macOS)
sudo ./setup-script.sh
```

**Network Connection Issues:**

- Ensure stable internet connection
- Check firewall settings
- Try running script with VPN if behind corporate firewall

**Package Installation Failures:**

```bash
# Clean package manager cache
# Ubuntu/Debian
sudo apt clean && sudo apt autoclean

# macOS
brew cleanup

# Windows
choco cleancache
```

**Python Installation Issues:**

```bash
# Reinstall Python with pyenv (Linux/macOS)
curl https://pyenv.run | bash
pyenv install 3.11.0
pyenv global 3.11.0
```

### Platform-Specific Issues

**Ubuntu/Linux:**

- **NVIDIA Driver Issues:** Run `ubuntu-drivers devices` and `sudo ubuntu-drivers autoinstall`
- **Missing Dependencies:** Install with `sudo apt install build-essential`

**macOS:**

- **Xcode Command Line Tools:** Run `xcode-select --install`
- **Homebrew Issues:** Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

**Windows:**

- **WSL Installation:** Enable in Windows Features and restart
- **PowerShell Execution Policy:** Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

## 🎯 Customization Options

### Environment Variables

Create `~/.config/setup/custom.env`:

```bash
# Custom Python version
PYTHON_VERSION="3.11"

# Custom Node.js version
NODE_VERSION="18"

# Skip certain installations
SKIP_DOCKER=true
SKIP_ANACONDA=true

# Custom installation paths
NVIM_CONFIG_REPO="https://github.com/your-username/nvim-config.git"
```

### Package Selections

**Ubuntu Custom Packages (`custom-packages.txt`):**

```
# Add additional APT packages
zsh
tmux
ripgrep
fd-find
bat
```

**macOS Custom Packages (`custom-brew.txt`):**

```
# Add additional Homebrew packages
zsh-autosuggestions
zsh-syntax-highlighting
fzf
ripgrep
```

### Configuration Overrides

**Custom Dotfiles Repository:**

```bash
export DOTFILES_REPO="https://github.com/your-username/dotfiles.git"
export DOTFILES_BRANCH="main"
```

## 📊 Installation Metrics

**Estimated Installation Times:**

- **Ubuntu/Linux:** 15-25 minutes
- **macOS:** 20-30 minutes
- **Windows:** 25-35 minutes

**Disk Space Requirements:**

- **Base Installation:** ~3GB
- **With Anaconda:** ~6GB
- **Full Development Suite:** ~8GB

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Test your changes on target platform
4. Commit your changes (`git commit -am 'Add improvement'`)
5. Push to the branch (`git push origin feature/improvement`)
6. Create a Pull Request

## ⭐ Credits

**Maintained by:** Programmer-RD-AI  
**Contributors:** See GitHub contributors list  
**Special Thanks:** Open source community for the amazing tools

---

**Tip:** Run these setup scripts in a virtual machine first to test before applying to your main development environment!
