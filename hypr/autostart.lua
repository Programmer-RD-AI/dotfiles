-- Extra autostart processes.

-- Notification daemon.
o.launch_on_start("swaync")

-- Vicinae launcher daemon (backs the SUPER+SPACE binding).
o.launch_on_start("vicinae server")

-- Open the standard app-per-workspace layout at login.
-- Edit the layout in ~/.dotfiles/scripts/omarchy-workspace-autostart.sh
o.exec_on_start("$HOME/.dotfiles/scripts/omarchy-workspace-autostart.sh")
