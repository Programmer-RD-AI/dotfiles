local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- General Options
config.check_for_updates = true
config.term = "xterm-256color"
config.use_ime = true

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0
}
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.7
}
config.initial_rows = 30
config.initial_cols = 130
config.scrollback_lines = 3500
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.automatically_reload_config = true

-- Appearance
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0
config.window_background_opacity = 1.0

local COLORS = {
    background = "#1e1e2e",
    foreground = "#c0caf5",
    pastel_green = "#80ef80",
    inactive_gray = "#909090",
    hover_gray = "#aaaaaa"
}

config.colors = {
    background = COLORS.background,
    foreground = COLORS.foreground,
    tab_bar = {
        background = COLORS.background,
        active_tab = {
            bg_color = "#2e2e4e",
            fg_color = COLORS.pastel_green
        },
        inactive_tab = {
            bg_color = COLORS.background,
            fg_color = COLORS.inactive_gray
        },
        inactive_tab_hover = {
            bg_color = COLORS.background,
            fg_color = COLORS.hover_gray
        },
        new_tab = {
            bg_color = COLORS.background,
            fg_color = COLORS.foreground
        },
        new_tab_hover = {
            bg_color = "#3e3e6e",
            fg_color = COLORS.foreground
        }
    }
}

-- Key Bindings
config.disable_default_key_bindings = true
config.leader = {
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 1000
}

config.keys = {
    -- Tab management
    {
        key = "t",
        mods = "LEADER",
        action = act.SpawnTab("CurrentPaneDomain")
    },
    {
        key = "w",
        mods = "LEADER",
        action = act.CloseCurrentTab({
            confirm = true
        })
    },
    
    -- Direct tab switching with Ctrl+1...9
    {
        key = "1",
        mods = "CTRL",
        action = act.ActivateTab(0)
    },
    {
        key = "2",
        mods = "CTRL",
        action = act.ActivateTab(1)
    },
    {
        key = "3",
        mods = "CTRL",
        action = act.ActivateTab(2)
    },
    {
        key = "4",
        mods = "CTRL",
        action = act.ActivateTab(3)
    },
    {
        key = "5",
        mods = "CTRL",
        action = act.ActivateTab(4)
    },
    {
        key = "6",
        mods = "CTRL",
        action = act.ActivateTab(5)
    },
    {
        key = "7",
        mods = "CTRL",
        action = act.ActivateTab(6)
    },
    {
        key = "8",
        mods = "CTRL",
        action = act.ActivateTab(7)
    },
    {
        key = "9",
        mods = "CTRL",
        action = act.ActivateTab(8)
    },
    
    -- Pane splits
    {
        key = "\\",
        mods = "LEADER",
        action = act.SplitVertical({
            domain = "CurrentPaneDomain"
        })
    },
    {
        key = "-",
        mods = "LEADER",
        action = act.SplitHorizontal({
            domain = "CurrentPaneDomain"
        })
    },
    {
        key = "x",
        mods = "LEADER",
        action = act.CloseCurrentPane({
            confirm = true
        })
    },
    
    -- Pane navigation (vim-style)
    {
        key = "h",
        mods = "CTRL",
        action = act.ActivatePaneDirection("Left")
    },
    {
        key = "j",
        mods = "CTRL",
        action = act.ActivatePaneDirection("Down")
    },
    {
        key = "k",
        mods = "CTRL",
        action = act.ActivatePaneDirection("Up")
    },
    {
        key = "l",
        mods = "CTRL",
        action = act.ActivatePaneDirection("Right")
    },
    
    -- Clipboard
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = act.CopyTo("Clipboard")
    },
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = act.PasteFrom("Clipboard")
    },
    
    -- Font resizing
    {
        key = "=",
        mods = "CTRL",
        action = act.IncreaseFontSize
    },
    {
        key = "-",
        mods = "CTRL",
        action = act.DecreaseFontSize
    },
    {
        key = "0",
        mods = "CTRL",
        action = act.ResetFontSize
    }
}

return config
