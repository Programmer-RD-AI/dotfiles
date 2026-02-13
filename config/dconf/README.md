# Dconf

GNOME desktop environment settings.

## What's Included

This contains exported GNOME configuration settings for:
- Keyboard shortcuts
- Desktop appearance
- Window behavior
- System preferences

## Usage

**Export settings:**
```bash
dconf dump / > ~/.dotfiles/config/dconf/user
```

**Import settings:**
```bash
dconf load / < ~/.dotfiles/config/dconf/user
```

> Note: This is primarily for GNOME-based Linux systems.
