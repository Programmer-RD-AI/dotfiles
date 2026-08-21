# Omarchy user template: herdr bar chrome.
#
# Rendered per theme into ~/.local/state/omarchy/current/theme/shell.bar.toml,
# which omarchy applies as a section override replacing [bar] in shell.toml.
# Only this section is overridden, so the rest of the generated shell.toml
# (notifications, menu, launcher, popups, ...) keeps tracking the theme.
#
# Values chosen to match the old waybar look: black bar, white text, 40px tall.
# {{ placeholders }} are substituted from the theme's colors.toml.

[bar]
background       = "#000000"
background-alpha = 1.0
text             = "#ffffff"

# Modules calling attention to themselves (recording, voxtype, alerts, updates)
# stay theme-driven rather than pinned.
active           = "{{ red }}"

# waybar used a fixed 40px height, so pin the size instead of letting it
# track [font] base-size.
scale-with-font  = false
size-horizontal  = 40
size-vertical    = 40
