# Git

Global git configuration.

## Setup

```bash
ln -sf ~/.dotfiles/config/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/config/git/ignore ~/.config/git/ignore
```

## Features

- **Git LFS** – Large file storage filter enabled
- **Credential store** – Credentials persisted via `git credential store`

## Aliases

- `wta <branch>` → Create and add a new worktree at `../<branch>`
- `wtr <branch>` → Remove the worktree at `../<branch>`
- `wtl` → List all worktrees

## Global Gitignore

Files ignored across all repos:

- `.claude/settings.local.json` – Local Claude AI settings
- `.worktrees/` – Worktree directories
