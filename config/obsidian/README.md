# Obsidian Vault - Vim Keybindings

Vim-style keybindings for Obsidian note-taking app.

## Setup

Copy the vault config JSON to your Obsidian vault's `.obsidian/` directory to enable these vim bindings.

## General

| Key | Action |
|-----|--------|
| `jk` | Exit insert mode (Escape) |
| `gd` | Follow link under cursor |
| `[[` | Surround selection with wiki link `[[ ]]` |

## Navigation

| Key | Action |
|-----|--------|
| `Ctrl+o` | Go back |
| `Ctrl+i` | Go forward |

## Focus Panes

| Key | Action |
|-----|--------|
| `Ctrl+h` | Focus left pane |
| `Ctrl+j` | Focus bottom pane |
| `Ctrl+k` | Focus top pane |
| `Ctrl+l` | Focus right pane |

## Splits

| Key | Action |
|-----|--------|
| `sv` | Split vertical |
| `ss` | Split horizontal |
| `:q` | Close current pane |

## Tabs

| Key | Action |
|-----|--------|
| `gt` | Next tab |
| `gT` | Previous tab |
| `Space tl` | Go to last tab |
| `Space tn` | New tab |

## Windows

| Key | Action |
|-----|--------|
| `Space wn` | Open in new window |
| `Space wm` | Move to new window |

## Search

| Key | Action |
|-----|--------|
| `/` | Open search |
| `Space sr` | Search and replace |
| `Space sf` | Quick file switcher |
| `Space sg` | Global search |

## Sidebar & Panels

| Key | Action |
|-----|--------|
| `Space e` | File explorer |
| `Space st` | Tag pane |

## Graph & Notes

| Key | Action |
|-----|--------|
| `Space og` | Open graph view |
| `Space od` | Open daily note |

## Surround (Visual Mode)

| Key | Action |
|-----|--------|
| `S"` | Surround with double quotes |
| `S'` | Surround with single quotes |
| `Sb` / `S(` / `S)` | Surround with parentheses |
| `S[` / `S]` | Surround with square brackets |
| `S{` / `S}` | Surround with curly brackets |
