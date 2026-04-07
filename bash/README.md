# bash

my linux shell config.

## setup

```bash
ln -sf ~/.dotfiles/bash/bashrc ~/.bashrc
source ~/.bashrc
```

## aliases

**safety & enhanced defaults**
- `cp` → `cp -iv` (interactive + verbose)
- `mv` → `mv -iv`
- `rm` → `rm -i`
- `mkdir` → `mkdir -pv`

**navigation**
- `..`, `...`, `....` → Go up directories

**files**
- `ls`, `ll`, `la` → exa with colors and git status
- `tree`, `treeb` → exa tree (2-level / 1-level)
- `mkd` → `mkdir -p`
- `rmf` → `rm -rf`

**git**
- `g` → git
- `gs`, `ga`, `gc`, `gd` → status, add, commit, diff
- `gca`, `gcb`, `gb`, `gl` → amend, checkout branch, branch, log
- `gpl`, `gpr`, `gf` → pull, push origin, fetch

**python**
- `py` → python
- `py3` → python3
- `pipi` → pip install
- `rc`, `rcf`, `rf` → ruff check / check+fix / format

**system**
- `c` → clear
- `cl` → clear + ls
- `e` → exit
- `reload` → source ~/.bashrc
- `update` → apt update + upgrade
- `df`, `free`, `top` → disk/mem/process via htop

**config shortcuts**
- `cvc` → open nvim config
- `cbc` → open bash config

**apps**
- `openapps` → open Chrome, Spotify, GitHub Desktop, VS Code

## functions

- `show_system_info` → Ubuntu ASCII logo + system info (runs on shell start)
- `load_env [file]` → Load .env vars (default `.env`)
- `run_mongo_container` → Start a fresh MongoDB Docker container on port 27017
- `transcribe [file]` → Audio to text using FFmpeg + Whisper (`-m`, `-l`, `-t`, `-f` flags)
- `extract <archive>` → Extract any archive format automatically

## git prompt

- `?` → Untracked files
- `*` → Modified files
- `+` → Staged files
- `-` → Deleted files

## features

- Vi mode (`set -o vi`)
- Auto-cd, cdspell, dirspell, globstar, checkwinsize
- Shared history with dedup (100k/200k)
- Conda and NVM integrations
- Local overrides via `~/.bash_local` and `~/.bash_private`
