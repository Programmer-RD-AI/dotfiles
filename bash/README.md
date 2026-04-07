# Bash

Linux shell config.

## Setup

```bash
ln -sf ~/.dotfiles/bash/bashrc ~/.bashrc
source ~/.bashrc
```

## Aliases

**Safety & Enhanced Defaults**
- `cp` → `cp -iv` (interactive + verbose)
- `mv` → `mv -iv`
- `rm` → `rm -i`
- `mkdir` → `mkdir -pv`

**Navigation**
- `..`, `...`, `....` → Go up directories

**Files**
- `ls`, `ll`, `la` → exa with colors and git status
- `tree`, `treeb` → exa tree (2-level / 1-level)
- `mkd` → `mkdir -p`
- `rmf` → `rm -rf`

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
- `cl` → clear + ls
- `e` → exit
- `reload` → source ~/.bashrc
- `update` → apt update + upgrade
- `df`, `free`, `top` → disk/mem/process via htop

**Config Shortcuts**
- `cvc` → open nvim config
- `cbc` → open bash config

**Apps**
- `openapps` → open Chrome, Spotify, GitHub Desktop, VS Code

## Functions

- `show_system_info` → Ubuntu ASCII logo + system info (runs on shell start)
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

- Vi mode (`set -o vi`)
- Auto-cd, cdspell, dirspell, globstar, checkwinsize
- Shared history with dedup (100k/200k)
- Conda and NVM integrations
- Local overrides via `~/.bash_local` and `~/.bash_private`

