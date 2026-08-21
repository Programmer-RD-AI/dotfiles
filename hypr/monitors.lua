-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- 1x setup for 1080p / 1440p / ultrawide displays.
hl.env("GDK_SCALE", "1")
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- Good compromise for 27" or 32" 4K monitors (but fractional!).
-- hl.env("GDK_SCALE", "1.75")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.6 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Disable a ghost monitor (e.g. Apple 6K XDR over Thunderbolt).
-- hl.monitor({ output = "DP-2", disabled = true })
