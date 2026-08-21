# Omarchy user template: control chrome (bar pills, buttons, dropdowns).
#
# Section override replacing [controls]. waybar drew its module groups as
# borderless pills filled with white at 8% (18% on hover):
#   bgPill      rgba(255, 255, 255, 0.08)
#   bgPillHover rgba(255, 255, 255, 0.18)
#
# Colours stay theme-driven ({{ foreground }}) on purpose: [controls] styles
# every control in the shell, including the omarchy menu and launcher, so
# pinning white here would break those on a coloured theme. Only the fill
# alphas and borders are matched to waybar.

[controls]
# Normal: idle control chrome. waybar pills had `border: none`.
normal-color        = "{{ foreground }}"
normal-fill-alpha   = 0.08
normal-border       = "{{ foreground }}"
normal-border-width = 0
normal-border-alpha = 0.4

# Hover-cursor: mouse hover and the panel keyboard cursor.
hover-cursor-color        = "{{ foreground }}"
hover-cursor-fill-alpha   = 0.18
hover-cursor-border       = "{{ foreground }}"
hover-cursor-border-width = 0
hover-cursor-border-alpha = 0.25

# Focus: mirror hover-cursor so hover, keyboard cursor and tab focus match.
focus-color        = "{{ foreground }}"
focus-fill-alpha   = 0.18
focus-border       = "{{ foreground }}"
focus-border-width = 0
focus-border-alpha = 0.25

# Selected: persistent chosen/current state.
selected-color        = "{{ foreground }}"
selected-fill-alpha   = 0.24
selected-border       = "{{ foreground }}"
selected-border-width = 0
selected-border-alpha = 1.0

# Momentary fills.
pressed-fill-alpha   = 0.22
selection-fill-alpha = 0.35
