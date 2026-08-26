-- Persistent app-to-workspace assignment.
--
-- Ported from the [[on-window-detected]] rules in aerospace/aerospace.toml, so
-- an app lands on the same workspace on both machines however it is launched.
-- scripts/omarchy-workspace-autostart.sh only opens them at login; these rules
-- also cover apps started later by hand.
--
-- Matches are loose substrings, in the style of Omarchy's own app rules
-- (default/hypr/apps/*.lua). A .desktop file's StartupWMClass is not reliably
-- the Wayland app-id: Obsidian advertises "md.Obsidian" but actually reports
-- "md.obsidian.Obsidian", so an exact match silently placed nothing and every
-- app opened on whichever workspace was current.
--
-- Case is handled with [Xx] character classes, not (?i) -- Hyprland's regex
-- does not support inline flags, and one there voids the whole pattern.
--
-- "silent" keeps focus where it is instead of following each app to its
-- workspace as it starts up.
--
-- Workspace numbers follow the autostart script. Note this differs from
-- aerospace.toml, which puts Spotify on 7 (Cron 8, WhatsApp 9); the Linux box
-- uses 4 for Codex and 5 and 6 for Spotify and Slack.

o.window("[gG]hostty",  { workspace = "1 silent" })
o.window("^zen$",       { workspace = "2 silent" })
o.window("[oO]bsidian", { workspace = "3 silent" })
o.window("codex",       { workspace = "4 silent" })
o.window("[sS]potify",  { workspace = "5 silent" })
o.window("[sS]lack",    { workspace = "6 silent" })
o.window("[oO]bsidian", { float = true })
