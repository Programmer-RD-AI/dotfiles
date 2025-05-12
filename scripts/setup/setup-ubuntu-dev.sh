#!/bin/bash

# ==============================================
# Ubuntu Development Environment Setup Script
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

# ==============================================
# 1. System Updates and Essential Packages
# ==============================================
log_message "Starting system updates and essential packages installation..."

sudo apt update
sudo apt install -y python3 python3-venv python3-pip \
    git curl build-essential vim wget \
    apt-transport-https ca-certificates \
    software-properties-common
check_success "Essential packages installation"

# ==============================================
# 2. Python Environment Setup
# ==============================================
log_message "Setting up Python environment..."

# Install requirements if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    check_success "Python requirements installation"
fi

# Install Anaconda
log_message "Installing Anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2023.11-Linux-x86_64.sh
bash Anaconda3-2023.11-Linux-x86_64.sh -b
rm Anaconda3-2023.11-Linux-x86_64.sh
source ~/.bashrc
check_success "Anaconda installation"

# ==============================================
# 3. Development Tools
# ==============================================
log_message "Installing development tools..."

# VS Code
sudo snap install --classic code
check_success "VS Code installation"

# Neovim
sudo apt install -y neovim
mkdir -p ~/.config/nvim
git clone https://github.com/Programmer-RD-AI/nvim-config.git ~/.config/nvim
mkdir -p ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
check_success "Neovim installation"

# GitHub Desktop
wget https://github.com/shiftkey/desktop/releases/download/release-3.2.5-linux2/GitHubDesktop-linux-3.2.5-linux2.deb
sudo dpkg -i GitHubDesktop-linux-3.2.5-linux2.deb
sudo apt --fix-broken install -y
rm GitHubDesktop-linux-3.2.5-linux2.deb
check_success "GitHub Desktop installation"

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -xvzf postman.tar.gz
sudo mv Postman /opt/
sudo ln -s /opt/Postman/Postman /usr/bin/postman
rm postman.tar.gz
check_success "Postman installation"

# StarUML
wget https://staruml.io/download/release/StarUML-5.0.2.deb
sudo dpkg -i StarUML-5.0.2.deb
sudo apt --fix-broken install -y
rm StarUML-5.0.2.deb
check_success "StarUML installation"

# ==============================================
# 4. Docker Installation
# ==============================================
log_message "Installing Docker..."

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
check_success "Docker installation"

# ==============================================
# 5. Productivity Tools
# ==============================================
log_message "Installing productivity tools..."

# Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable
check_success "Google Chrome installation"

# Notion
sudo snap install notion-snap
check_success "Notion installation"

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo tee /etc/apt/trusted.gpg.d/spotify.asc
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client
check_success "Spotify installation"

# Warp Terminal
curl -fsSL https://warp.sh/install.sh | bash
check_success "Warp installation"

# ==============================================
# 6. NVIDIA Driver Installation
# ==============================================
log_message "Installing NVIDIA drivers..."

sudo apt update
# sudo apt install -y nvidia-driver-460
check_success "NVIDIA driver installation"

# ==============================================
# 7. Shell Configuration
# ==============================================
log_message "Setting up shell configuration..."

cd ~
git clone https://github.com/Programmer-RD-AI/.bashrc.git
mv ~/.bashrc ~/.bashrc.backup
cp .bashrc/.bashrc ~/
source ~/.bashrc
check_success "Shell configuration setup"

log_message "Installation complete! Please reboot your system to apply all changes."
