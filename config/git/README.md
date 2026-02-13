# Git

Custom git configuration with worktree aliases.

## Worktree Aliases

- `git wta <branch>` → Add worktree in parallel directory
- `git wtr <branch>` → Remove worktree
- `git wtl` → List worktrees

## Config

- **Git LFS**: Enabled for large file support
- **Credential helper**: Store credentials securely
- **Global ignore**: Custom ignore patterns in `ignore` file

## Setup

Link the git config:
```bash
ln -sf ~/.dotfiles/config/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/config/git/ignore ~/.config/git/ignore
```
