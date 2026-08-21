-- Extra autostart processes.

-- Note: vicinae runs from its own systemd user unit (vicinae.service, bound to
-- graphical-session.target), so it is NOT started here:
--   systemctl --user enable --now vicinae.service
--
-- Note: swaync is not started either. This machine's Omarchy uses herdr
-- (quickshell) for the bar AND notifications, and herdr already owns the
-- org.freedesktop.Notifications DBus name, so swaync cannot acquire it.

-- Open the standard app-per-workspace layout at login.
-- Edit the layout in ~/.dotfiles/scripts/omarchy-workspace-autostart.sh
o.exec_on_start("$HOME/.dotfiles/scripts/omarchy-workspace-autostart.sh")
