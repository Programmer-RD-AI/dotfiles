#!/bin/bash

# -----------------------------------------------------------------------------
# refresh-dotfiles.sh - A script to refresh and sync all dotfile configurations
# -----------------------------------------------------------------------------

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# -----------------------------------------------------------------------------
# Helper functions
# -----------------------------------------------------------------------------

# Print a header
print_header() {
    echo -e "\n${BOLD}${BLUE}=== $1 ===${NC}\n"
}

# Print a success message
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Print an error message
print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Print a warning message
print_warning() {
    echo -e "${YELLOW}! $1${NC}"
}

# Print an info message
print_info() {
    echo -e "${CYAN}ℹ $1${NC}"
}

# Create a symbolic link
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check if the source exists
    if [ ! -e "$source" ]; then
        print_error "Source '$source' does not exist."
        return 1
    fi
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # If target is a symlink, remove it
    if [ -L "$target" ]; then
        rm "$target"
    # If target exists and is not a symlink, back it up
    elif [ -e "$target" ]; then
        local backup="${target}.bak.$(date +%Y%m%d%H%M%S)"
        print_warning "Target '$target' exists but is not a symlink. Backing up to '$backup'."
        mv "$target" "$backup"
    fi
    
    # Create symlink
    ln -s "$source" "$target"
    
    if [ $? -eq 0 ]; then
        print_success "Created symlink: $target -> $source"
        return 0
    else
        print_error "Failed to create symlink: $target -> $source"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Main script
# -----------------------------------------------------------------------------

print_header "Dotfiles Refresh Script"
print_info "Refreshing dotfiles in $(pwd)"

# Get the absolute path to the dotfiles directory
DOTFILES_DIR="$(pwd)"
CONFIG_DIR="$DOTFILES_DIR/.config"

# Ensure we're in the right directory
if [ ! -d "$CONFIG_DIR" ]; then
    print_error "Cannot find .config directory. Please run this script from the dotfiles root directory."
    exit 1
fi

# -----------------------------------------------------------------------------
# Create symlinks for all config directories
# -----------------------------------------------------------------------------

print_header "Creating Config Symlinks"

# Auto-detect config directories
config_dirs=$(find "$CONFIG_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")

# Process each config directory
for dir in $config_dirs; do
    source_dir="$CONFIG_DIR/$dir"
    target_dir="$HOME/.config/$dir"
    
    print_info "Processing $dir configuration..."
    
    # Remove existing target directory or symlink
    if [ -L "$target_dir" ]; then
        rm "$target_dir"
        print_info "Removed existing symlink $target_dir"
    elif [ -d "$target_dir" ]; then
        backup_dir="${target_dir}.bak.$(date +%Y%m%d%H%M%S)"
        print_warning "Target '$target_dir' exists. Backing up to '$backup_dir'"
        mv "$target_dir" "$backup_dir"
    fi
    
    # Create symlink for the directory
    create_symlink "$source_dir" "$target_dir"
done

# -----------------------------------------------------------------------------
# Source bash configuration
# -----------------------------------------------------------------------------

print_header "Sourcing Bash Configuration"

# Source bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    print_info "Sourcing ~/.bashrc"
    source "$HOME/.bashrc"
    if [ $? -eq 0 ]; then
        print_success "Bash configuration sourced successfully"
    else
        print_error "Failed to source bash configuration"
    fi
else
    print_warning "~/.bashrc does not exist"
fi

# -----------------------------------------------------------------------------
# Reload tmux configuration
# -----------------------------------------------------------------------------

print_header "Reloading Tmux Configuration"

# Check if tmux is running
if pgrep -x "tmux" > /dev/null; then
    print_info "Tmux is running, reloading configuration"
    # Try to source tmux configuration
    tmux source-file "$HOME/.config/tmux/tmux.conf" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        print_success "Tmux configuration reloaded successfully"
    else
        print_warning "Failed to reload tmux configuration. Try manually with: tmux source-file ~/.config/tmux/tmux.conf"
    fi
else
    print_info "Tmux is not running, skipping configuration reload"
fi

# -----------------------------------------------------------------------------
# Final summary
# -----------------------------------------------------------------------------

print_header "Refresh Complete"
print_success "Your dotfiles have been refreshed and symlinked"
print_info "If there were any errors, please resolve them manually"
print_info "To completely apply all changes, you may want to restart your terminal"

exit 0

