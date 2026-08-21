-- Personal keybinding overrides, layered on top of Omarchy's defaults.
-- See current bindings: omarchy menu keybindings --print

-- Launcher: replace Omarchy's default SUPER+SPACE launcher with vicinae.
hl.unbind("SUPER + SPACE")
o.bind("SUPER + SPACE", "Vicinae launcher", "vicinae toggle")

-- Notification center (swaync).
o.bind("SUPER + N", "Notification center", "swaync-client -t -sw")

-- Window switching: SUPER+TAB toggles the last active window instead of
-- cycling workspaces, SUPER+SHIFT+TAB cycles to the previous window.
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
o.bind("SUPER + TAB", "Toggle last active window", "hyprctl dispatch focuscurrentorlast")
o.bind("SUPER + SHIFT + TAB", "Cycle to previous window", hl.dsp.window.cycle_next({ next = false }))

-- Logitech MX Keys.
-- Omarchy binds SUPER+SHIFT+S to the Google Maps web app; reclaim it for screenshots.
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Screenshot", "omarchy-capture-screenshot")
o.bind("SUPER + H", "Dictation", "voxtype record toggle")
o.bind("SUPER + PERIOD", "Emoji picker", "omarchy-shell shell toggle omarchy.emojis")

-- Typora instead of Omarchy's Omawrite.
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })
