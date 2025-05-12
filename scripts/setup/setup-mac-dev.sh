#!/bin/bash

# ==============================================
# MacOS Development Environment Setup Script
# ==============================================

set -e  # Exit on error
log_file="installation_log.txt"

# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$log_file"
}

# Function to check if a command was successful
check_success() {
    if [ $? -eq 0 ]; then
        log_message "✓ $1 completed successfully"
    else
        log_message "✗ Error during $1"
        exit 1
    fi
}

# Function to check if Homebrew is installed
check_brew() {
    if ! command -v brew &> /dev/null; then
        log_message "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        check_success "Homebrew installation"
    else
        log_message "Homebrew is already installed"
    fi
}

# ==============================================
# 1. Install Homebrew and System Updates
# ==============================================
log_message "Starting system setup..."

check_brew
brew update
check_success "Homebrew update"

# ==============================================
# 2. Python Environment Setup
# ==============================================
log_message "Setting up Python environment..."

brew install python
check_success "Python installation"

# Install requirements if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    check_success "Python requirements installation"
fi

# Install Anaconda
log_message "Installing Anaconda..."
brew install --cask anaconda
check_success "Anaconda installation"

# ==============================================
# 3. Development Tools
# ==============================================
log_message "Installing development tools..."

# Git
brew install git
check_success "Git installation"

# VS Code
brew install --cask visual-studio-code
check_success "VS Code installation"

# Vim and Neovim
brew install vim
brew install neovim
check_success "Vim and Neovim installation"

# Setup Neovim configuration
mkdir -p ~/.config/nvim
git clone https://github.com/Programmer-RD-AI/nvim-config.git ~/.config/nvim
mkdir -p ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
check_success "Neovim configuration setup"

# GitHub Desktop
brew install --cask github
check_success "GitHub Desktop installation"

# Postman
brew install --cask postman
check_success "Postman installation"

# StarUML
brew install --cask staruml
check_success "StarUML installation"

# ==============================================
# 4. Docker Installation
# ==============================================
log_message "Installing Docker..."

brew install --cask docker
check_success "Docker installation"

# ==============================================
# 5. Productivity Tools
# ==============================================
log_message "Installing productivity tools..."

# Notion
brew install --cask notion
check_success "Notion installation"

# Google Chrome
brew install --cask google-chrome
check_success "Google Chrome installation"

# Spotify
brew install --cask spotify
check_success "Spotify installation"

# Warp Terminal
brew install --cask warp
check_success "Warp Terminal installation"

# ==============================================
# 6. CUDA Installation
# ==============================================
log_message "Installing CUDA..."

brew install cuda
check_success "CUDA installation"

# ==============================================
# Final Steps
# ==============================================
log_message "Running cleanup..."
brew cleanup

log_message "Installation complete! Some applications may need to be opened manually for first-time setup."
log_message "You may need to restart your computer to ensure all applications are properly configured."
