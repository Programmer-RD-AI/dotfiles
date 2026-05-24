#!/usr/bin/env bash
# Auto-sync ~/Documents/obsidian-vault with its git remote.
# Modes: login (called on graphical-session start), logout (called on stop).

set -u

VAULT="$HOME/Documents/obsidian-vault"
LOG="$HOME/.cache/obsidian-sync.log"
MODE="${1:-login}"

mkdir -p "$(dirname "$LOG")"

log() {
  printf '[%s] [%s] %s\n' "$(date -Iseconds)" "$MODE" "$*" >> "$LOG"
}

cd "$VAULT" 2>/dev/null || { log "vault dir missing: $VAULT"; exit 0; }

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  log "not a git repo, skipping"
  exit 0
fi

# Wait briefly for network on login
if [ "$MODE" = "login" ]; then
  for _ in 1 2 3 4 5; do
    if getent hosts github.com >/dev/null 2>&1; then break; fi
    sleep 2
  done
fi

if [ -n "$(git status --porcelain)" ]; then
  log "local changes detected, committing"
  git add -A >> "$LOG" 2>&1
  git commit -m "auto-sync ($MODE): $(date -Iseconds)" >> "$LOG" 2>&1 || log "commit had nothing to do"
fi

log "pull --rebase --autostash"
git pull --rebase --autostash >> "$LOG" 2>&1 || log "pull failed (offline?)"

log "push"
git push >> "$LOG" 2>&1 || log "push failed (offline?)"

log "done"
