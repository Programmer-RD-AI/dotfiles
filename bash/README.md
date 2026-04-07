# Bash

## Aliases

**Navigation**
- `..`, `...`, `....` → Go up directories

**Files**
- `ls`, `ll`, `la` → exa with colors and git status
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
- `reload` → source ~/.bashrc
- `update` → apt update + upgrade
- `df`, `free`, `top` → disk/mem/process via htop

**Config Shortcuts**
- `cvc` → open nvim config
- `cbc` → open bash config

## Functions

- `show_system_info` → Display Ubuntu neofetch-style system info on shell start
- `load_env [file]` → Load .env vars (default `.env`)
- `run_mongo_container` → Start a fresh MongoDB Docker container on port 27017
- `transcribe [file]` → Audio to text using FFmpeg + Whisper (`-m`, `-l`, `-t`, `-f` flags)
- `extract <archive>` → Extract any archive format automatically

## Git Prompt

- `?` → Untracked files
- `*` → Modified files
- `+` → Staged files
- `-` → Deleted files

