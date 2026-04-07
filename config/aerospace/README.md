# AeroSpace

Tiling window manager for macOS.

## Setup

Get the app bundle ID for window rules:
```bash
cd /Applications && mdls -name kMDItemCFBundleIdentifier "AppName.app"
```

## Key Bindings

**Windows**
- `Alt+Arrow` → Focus window left/down/up/right
- `Alt+Shift+Arrow` → Move window left/down/up/right
- `Alt+f` → Fullscreen toggle
- `Alt+Shift+minus/equal` → Resize smart -50/+50

**Layout**
- `Alt+/` → Toggle tiles (horizontal/vertical)
- `Alt+,` → Toggle accordion (horizontal/vertical)

**Workspaces**
- `Alt+1-9` → Switch to workspace 1-9
- `Alt+Shift+1-9` → Move window to workspace 1-9
- `Alt+Tab` → Toggle last workspace
- `Alt+Shift+Tab` → Focus next window (DFS)

**Service Mode** (`Alt+Shift+;`)
- `Esc` → Reload config and exit service mode
- `r` → Flatten/reset layout
- `f` → Toggle floating/tiling
- `Backspace` → Close all windows except current
- `Alt+Shift+Arrow` → Join container left/down/up/right

**Other**
- `Alt+t` → Open new Ghostty terminal
- `Alt+Shift+c` → Reload config

## Workspace Assignments

| Workspace | App |
|-----------|-----|
| 1 | Ghostty (terminal) |
| 2 | Zen Browser |
| 3 | Obsidian |
| 7 | Spotify |
| 8 | Cron (calendar) |
| 9 | WhatsApp |

Workspaces 1-5 → secondary monitor  
Workspaces 6-9 → main monitor

## Features

- Window borders via `borders` (active: white, inactive: dark)
- Gaps: 10px inner + 10px outer
- Accordion padding: 30px
- Auto-start at login
