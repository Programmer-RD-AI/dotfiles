# Zsh

macOS shell config. Mirror of the bash config adapted for zsh + macOS.

## Setup

```bash
ln -sf ~/.dotfiles/config/zshrc/.zshrc ~/.zshrc
source ~/.zshrc
```

## Aliases

**Navigation**
- `..`, `...`, `....` → Go up directories

**Files**
- `ls`, `ll`, `la`, `l` → exa with colors and git status (falls back to `ls -G` if exa unavailable)
- `tree`, `treeb` → exa tree (2-level / 1-level)

**Git**
- `g` → git
- `gs`, `ga`, `gc`, `gd` → status, add, commit, diff
- `gca`, `gcb`, `gb`, `gl` → amend, checkout branch, branch, log
- `gpl`, `gpr`, `gf` → pull, push origin, fetch

**Python**
- `py` → python
- `py3` → python3
- `pipi` → pip install
- `rc`, `rcf`, `rf` → ruff check / check+fix / format

**System**
- `c` → clear
- `reload` → source ~/.zshrc
- `update` → brew update + upgrade
- `df`, `free` (vm_stat), `top` → disk/mem/process

**macOS Specific**
- `showfiles` / `hidefiles` → Toggle Finder hidden files
- `flushdns` → Flush DNS cache

**Config Shortcuts**
- `cvc` → open nvim config
- `czc` → open .zshrc

## Functions

- `load_env [file]` → Load .env vars (default `.env`)
- `run_mongo_container` → Start a fresh MongoDB Docker container on port 27017
- `transcribe [file]` → Audio to text using FFmpeg + Whisper (`-m`, `-l`, `-t`, `-f` flags)
- `extract <archive>` → Extract any archive format automatically

## Git Prompt

- `?` → Untracked files
- `*` → Modified files
- `+` → Staged files
- `-` → Deleted files

## Features

- Vi mode (`setopt VI`)
- Auto-cd, auto-pushd, dir stack
- Shared history with dedup (100k/200k)
- Zsh completion with menu select and fuzzy matching
- Homebrew, conda, nvm, bun, pnpm, gcloud, cargo integrations
- neofetch on shell start (once per session)
