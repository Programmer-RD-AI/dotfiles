# git

global git configuration.

## setup

```bash
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/ignore ~/.config/git/ignore
```

## features

- **Git LFS** – Large file storage filter enabled
- **Credential store** – Credentials persisted via `git credential store`

## aliases

- `wta <branch>` → Create and add a new worktree at `../<branch>`
- `wtr <branch>` → Remove the worktree at `../<branch>`
- `wtl` → List all worktrees

## global gitignore

files ignored across all repos:

- `.claude/settings.local.json` – Local Claude AI settings
- `.worktrees/` – Worktree directories
