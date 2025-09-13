# Bash Configuration

## Aliases

**Navigation**
- `..` → `cd ..`
- `...` → `cd ../..`
- `....` → `cd ../../..`

**Files**
- `ls` → `exa --color=always`
- `ll` → `exa -lhgF --git --color=always`
- `la` → `exa -lahgF --git --color=always`
- `tree` → `exa --tree --level=2`

**Git**
- `g` → `git`
- `gs` → `git status`
- `ga` → `git add`
- `gc` → `git commit -m`
- `gd` → `git diff`
- `gpl` → `git pull`
- `gpr` → `git push origin`

**Python**
- `py` → `python`
- `rc` → `ruff check`
- `rcf` → `ruff check --fix`
- `rf` → `ruff format`

**System**
- `c` → `clear`
- `reload` → `source ~/.bashrc`

## Functions

- `load_env [file]` - Load .env variables
- `run_mongo_container` - Start MongoDB container
- `transcribe` - Audio transcription with Whisper
- `extract` - Extract any archive

## Git Prompt

- `?` → Untracked files
- `*` → Modified files
- `+` → Staged files
- `-` → Deleted files
