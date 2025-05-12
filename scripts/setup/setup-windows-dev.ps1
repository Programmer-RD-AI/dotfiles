# ==============================================
# Windows Development Environment Setup Script
# ==============================================

# Requires -RunAsAdministrator

$ErrorActionPreference = 'Stop'
$LogFile = "installation_log.txt"

# Function to log messages
function Write-Log {
    param($Message)
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$TimeStamp] $Message"
    Write-Host $LogMessage
    Add-Content -Path $LogFile -Value $LogMessage
}

# Function to check if a command was successful
function Test-CommandSuccess {
    param($CommandName)
    if ($?) {
        Write-Log "✓ $CommandName completed successfully"
    } else {
        Write-Log "✗ Error during $CommandName"
        exit 1
    }
}

# Function to check if Chocolatey is installed
function Install-ChocolateyIfNeeded {
    if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Log "Installing Chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        Test-CommandSuccess "Chocolatey installation"
    } else {
        Write-Log "Chocolatey is already installed"
    }
}

# ==============================================
# 1. Initial Setup and Chocolatey Installation
# ==============================================
Write-Log "Starting system setup..."

Install-ChocolateyIfNeeded
choco upgrade chocolatey
Test-CommandSuccess "Chocolatey upgrade"

# ==============================================
# 2. Python Environment Setup
# ==============================================
Write-Log "Setting up Python environment..."

# Install Python requirements if requirements.txt exists
if (Test-Path "requirements.txt") {
    pip install -r requirements.txt
    Test-CommandSuccess "Python requirements installation"
}

# Install Anaconda
Write-Log "Installing Anaconda..."
choco install -y anaconda3
Test-CommandSuccess "Anaconda installation"

# ==============================================
# 3. Development Tools
# ==============================================
Write-Log "Installing development tools..."

# Git
choco install -y git
Test-CommandSuccess "Git installation"

# Node.js
choco install -y nodejs
Test-CommandSuccess "Node.js installation"

# VS Code
choco install -y vscode
Test-CommandSuccess "VS Code installation"

# Vim and Neovim
choco install -y vim
choco install -y neovim
Test-CommandSuccess "Vim and Neovim installation"

# Setup Neovim configuration
Write-Log "Setting up Neovim configuration..."

# Create Neovim config directory
$NvimConfigPath = "$env:LOCALAPPDATA\nvim"
New-Item -ItemType Directory -Force -Path $NvimConfigPath

# Clone Neovim config
Set-Location $NvimConfigPath
git clone https://github.com/Programmer-RD-AI/nvim-config.git .

# Setup Packer
$PackerPath = "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
New-Item -ItemType Directory -Force -Path $PackerPath
git clone --depth 1 https://github.com/wbthomason/packer.nvim $PackerPath

Test-CommandSuccess "Neovim configuration setup"

# ==============================================
# 4. Productivity Tools
# ==============================================
Write-Log "Installing productivity tools..."

# Notion
choco install -y notion
Test-CommandSuccess "Notion installation"

# Google Chrome
choco install -y googlechrome
Test-CommandSuccess "Google Chrome installation"

# ==============================================
# 5. NVIDIA Driver Installation
# ==============================================
Write-Log "Installing NVIDIA drivers..."

choco install -y nvidia-driver
Test-CommandSuccess "NVIDIA driver installation"

# ==============================================
# 6. WSL and Warp Setup
# ==============================================
Write-Log "Setting up WSL and Warp..."

# Enable WSL
Write-Log "Enabling WSL..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Note about Warp installation
Write-Log "Note: Warp should be installed within WSL using:"
Write-Log "wsl -e bash -c 'curl -fsSL https://warp.sh/install.sh | bash'"

# ==============================================
# Final Steps
# ==============================================
Write-Log "Installation complete! Please consider the following:"
Write-Log "1. Restart your computer to ensure all applications are properly configured"
Write-Log "2. After restart, open WSL and install Warp using the command provided above"
Write-Log "3. Some applications may need to be opened manually for first-time setup"
Write-Log "4. Check the log file at $LogFile for any issues"
