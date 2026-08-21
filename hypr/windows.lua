-- Persistent app-to-workspace assignment.
--
-- Ported from the [[on-window-detected]] rules in aerospace/aerospace.toml, so
-- an app lands on the same workspace on both machines however it is launched.
-- scripts/omarchy-workspace-autostart.sh only places apps at login; these rules
-- also cover apps opened later by hand.
--
-- Workspace numbers follow the layout used by the autostart script. Note this
-- differs from aerospace.toml, which puts Spotify on 7 (with Cron on 8 and
-- WhatsApp on 9); the Linux box uses 4 and 5 for Spotify and Slack.
--
-- Class names come from each app's StartupWMClass / hyprctl clients.

o.window("com.mitchellh.ghostty", { workspace = "1" })
o.window("^zen$",                 { workspace = "2" })
o.window("md.Obsidian",           { workspace = "3" })
o.window("^spotify$",             { workspace = "4" })
o.window("^Slack$",               { workspace = "5" })
