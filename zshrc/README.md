# zsh

my macos shell config. mirror of the bash config adapted for zsh + macos.

## setup

```bash
ln -sf ~/.dotfiles/zshrc/.zshrc ~/.zshrc
source ~/.zshrc
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
- `ls`, `ll`, `la`, `l` → exa with colors and git status (falls back to `ls -G` if exa unavailable)
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
- `reload` → source ~/.zshrc
- `update` → brew update + upgrade
- `df`, `free` (vm_stat), `top` → disk/mem/process

**macos specific**
- `showfiles` / `hidefiles` → Toggle Finder hidden files
- `flushdns` → Flush DNS cache

**config shortcuts**
- `cvc` → open nvim config
- `czc` → open .zshrc

**apps**
- `openapps` → open Chrome, Spotify, GitHub Desktop, VS Code

## functions

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

- Vi mode (`setopt VI`)
- Auto-cd, auto-pushd, dir stack
- Shared history with dedup (100k/200k)
- Zsh completion with menu select and fuzzy matching
- Homebrew, conda, nvm, bun, pnpm, gcloud, cargo integrations
- neofetch on shell start (once per session)
