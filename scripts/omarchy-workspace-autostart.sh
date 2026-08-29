#!/usr/bin/env bash
# Open the standard app-per-workspace layout at login.
#
# Wired up from hypr/autostart.lua via o.exec_on_start(). Safe to run by hand:
#   ~/.dotfiles/scripts/omarchy-workspace-autostart.sh
#
# Apps already running are skipped, so re-running won't open duplicates.
# Missing apps are skipped with a warning instead of failing the whole layout.

set -uo pipefail

# workspace : binary to check : command to launch
LAYOUT=(
  "1:ghostty:ghostty"
  "2:/opt/zen-browser-bin/zen-bin:/opt/zen-browser-bin/zen-bin"
  "3:obsidian:obsidian"
  "4:ai.opencode.desktop:/opt/OpenCode/ai.opencode.desktop"
  "5:spotify:spotify"
  "6:slack:slack"
)

log() { printf '[workspace-autostart] %s\n' "$*" >&2; }

if ! command -v hyprctl >/dev/null 2>&1; then
  log "hyprctl not found - not running under Hyprland, aborting"
  exit 0
fi

# Wait for the compositor to accept commands (login race).
for _ in {1..30}; do
  hyprctl monitors >/dev/null 2>&1 && break
  sleep 0.5
done

launch() {
  local ws=$1 bin=$2 cmd=$3

  local proc=${bin##*/}

  if ! command -v "$bin" >/dev/null 2>&1 && [[ ! -x "$bin" ]]; then
    log "skip workspace $ws: '$bin' is not installed"
    return
  fi

  if pgrep -x "$proc" >/dev/null 2>&1; then
    log "skip workspace $ws: '$bin' is already running"
    return
  fi

  log "workspace $ws -> $cmd"
  hyprctl dispatch exec "[workspace $ws silent] uwsm-app -- $cmd" >/dev/null
}

for entry in "${LAYOUT[@]}"; do
  IFS=: read -r ws bin cmd <<<"$entry"
  launch "$ws" "$bin" "$cmd"
done

log "done"
