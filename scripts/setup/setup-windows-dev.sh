#!/bin/bash

# ==============================================
# Windows Development Environment Bash Setup Script
# For use in WSL or Git Bash
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

# Function to check if running in WSL
check_wsl() {
    if grep -q Microsoft /proc/version; then
        return 0  # Running in WSL
    else
        return 1  # Not running in WSL
    fi
}

# ==============================================
# 1. Initial Setup and Environment Check
# ==============================================
log_message "Starting system setup..."

if check_wsl; then
    log_message "Running in WSL environment"
else
    log_message "Running in Git Bash or other bash environment"
fi

# ==============================================
# 2. Python Environment Setup
# ==============================================
log_message "Setting up Python environment..."

# Install Python if not present
if ! command -v python3 &> /dev/null; then
    if check_wsl; then
        sudo apt update
        sudo apt install -y python3 python3-pip
    else
        log_message "Please install Python manually in Windows environment"
        exit 1
    fi
fi
check_success "Python installation"

# Install requirements if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt
    check_success "Python requirements installation"
fi

# ==============================================
# 3. Development Tools Setup
# ==============================================
log_message "Setting up development tools..."

if check_wsl; then
    # WSL-specific installations
    sudo apt update
    sudo apt install -y git vim curl wget
    check_success "Basic development tools installation"

    # Neovim installation
    sudo apt install -y neovim
    check_success "Neovim installation"
else
    log_message "Skipping package installation in non-WSL environment"
fi

# ==============================================
# 4. Neovim Configuration
# ==============================================
log_message "Setting up Neovim configuration..."

# Create Neovim config directory
mkdir -p ~/.config/nvim
cd ~/.config/nvim || exit

# Backup existing configuration if present
if [ -d "./nvim-config" ]; then
    mv ./nvim-config "./nvim-config.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Clone Neovim configuration
git clone https://github.com/Programmer-RD-AI/nvim-config.git .
check_success "Neovim configuration clone"

# Setup Packer
mkdir -p ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
check_success "Packer installation"

# ==============================================
# 5. Warp Terminal Installation (WSL only)
# ==============================================
if check_wsl; then
    log_message "Installing Warp Terminal..."
    curl -fsSL https://warp.sh/install.sh | bash
    check_success "Warp installation"
fi

# ==============================================
# 6. Shell Configuration
# ==============================================
log_message "Setting up shell configuration..."

# Backup existing .bashrc
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)
fi

# Add useful aliases and configurations
cat >> ~/.bashrc << 'EOL'

# Custom aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias python=python3
alias pip=pip3

# Environment variables
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
EOL

check_success "Shell configuration setup"

# ==============================================
# Final Steps and Instructions
# ==============================================
log_message "Installation complete! Please consider the following steps:"

if check_wsl; then
    log_message "WSL-specific notes:"
    log_message "1. Restart your WSL terminal to apply all changes"
    log_message "2. Run 'source ~/.bashrc' to apply shell changes"
    log_message "3. Consider installing Windows Terminal from Microsoft Store for better WSL integration"
else
    log_message "Git Bash notes:"
    log_message "1. Restart Git Bash to apply all changes"
    log_message "2. Run 'source ~/.bashrc' to apply shell changes"
    log_message "3. Make sure to install Windows-specific tools using the PowerShell script"
fi

log_message "Common next steps:"
log_message "1. Configure Git global settings:"
log_message "   git config --global user.name 'Your Name'"
log_message "   git config --global user.email 'your.email@example.com'"
log_message "2. Test Neovim configuration: 'nvim'"
log_message "3. Check the log file at $log_file for any issues"
