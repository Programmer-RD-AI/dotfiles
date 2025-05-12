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

## 📦 What Gets Installed

### Common Tools Across All Platforms

- Python & pip
- Git
- Visual Studio Code
- Neovim (with custom configuration)
- Docker
- Node.js
- Anaconda
- Notion
- Google Chrome
- Postman
- GitHub Desktop
- Spotify
- StarUML
- Warp Terminal

### Platform-Specific Installations

#### Ubuntu/Linux

- NVIDIA drivers
- Build essentials
- APT package management tools
- Custom bashrc configuration

#### macOS

- Homebrew
- CUDA
- macOS-specific package configurations

#### Windows

- Chocolatey package manager
- WSL (Windows Subsystem for Linux)
- NVIDIA drivers
- Windows-specific configurations

## 📝 Configuration

### Neovim Setup

The scripts set up Neovim with a custom configuration from [nvim-config repository](https://github.com/Programmer-RD-AI/nvim-config.git).

### Shell Configuration

- Custom aliases
- Environment variables
- Git shortcuts
- Enhanced command-line experience

## 🔄 Updating

To update already installed packages:

### Ubuntu/Linux

```bash
sudo apt update
sudo apt upgrade
```

### macOS

```bash
brew update
brew upgrade
```

### Windows

```powershell
choco upgrade all
```

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## ⭐ Credits

Maintained by Programmer-RD-AI
