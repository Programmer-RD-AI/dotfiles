#!/usr/bin/env bash
# Open the standard app-per-workspace layout at login.
#
# Wired up from hypr/autostart.lua via o.exec_on_start(). Safe to run by hand:
#   ~/.dotfiles/scripts/omarchy-workspace-autostart.sh
#
# Workspace placement is NOT done here. hypr/windows.lua carries window rules
# mapping each app's class to a workspace, so an app lands correctly however it
# is started. Current Hyprland parses `hyprctl dispatch` as Lua, so the old
#   hyprctl dispatch exec "[workspace N silent] ..."
# form is a syntax error and silently placed nothing.
#
# Apps already running are skipped, so re-running won't open duplicates, and
# apps that aren't installed are skipped with a warning rather than failing
# the whole layout.

set -uo pipefail

# workspace (documentation only; hypr/windows.lua enforces it)
#   : launcher binary  : running-process name : command
# The process name is not always the launcher name -- zen-browser is a shell
# script that execs zen-bin -- so the already-running check needs it spelled
# out, or it never matches and we open a duplicate.
LAYOUT=(
  "1:ghostty:ghostty:ghostty"
  "2:zen-browser:zen-bin:zen-browser"
  "3:obsidian:obsidian:obsidian"
  "4:codex-desktop:codex-desktop:codex-desktop"
  "5:spotify:spotify:spotify"
  "6:slack:slack:slack"
)

log() { printf '[workspace-autostart] %s\n' "$*" >&2; }

# Wait for the compositor to accept commands (login race).
if command -v hyprctl >/dev/null 2>&1; then
  for _ in {1..30}; do
    hyprctl monitors >/dev/null 2>&1 && break
    sleep 0.5
  done
fi

launch() {
  local ws=$1 bin=$2 proc=$3 cmd=$4

  if ! command -v "$bin" >/dev/null 2>&1; then
    log "skip workspace $ws: '$bin' is not installed"
    return
  fi

  if pgrep -x "$proc" >/dev/null 2>&1; then
    log "skip workspace $ws: '$bin' is already running"
    return
  fi

  log "workspace $ws -> $cmd"
  if command -v uwsm-app >/dev/null 2>&1; then
    setsid uwsm-app -- $cmd >/dev/null 2>&1 &
  else
    setsid $cmd >/dev/null 2>&1 &
  fi
  # Stagger so the compositor applies each window rule before the next appears.
  sleep 1
}

for entry in "${LAYOUT[@]}"; do
  IFS=: read -r ws bin proc cmd <<<"$entry"
  launch "$ws" "$bin" "$proc" "$cmd"
done

log "done"
