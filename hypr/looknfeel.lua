-- Change the default Omarchy look'n'feel.

hl.config({
  general = {
    gaps_in = 8,
    gaps_out = 20,

    -- Black / gray border scheme.
    col = {
      active_border = { colors = { "rgba(888888ff)", "rgba(444444ff)" }, angle = 45 },
      inactive_border = "rgba(1a1a1aaa)",
    },

    -- Mouse drag on borders/gaps to resize tiles.
    resize_on_border = true,
    extend_border_grab_area = 15,
    hover_icon_on_border = true,
  },

  decoration = {
    rounding = 12,
  },

  animations = {
    enabled = true,
  },
})

-- Personal animation curves.
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("wsSlide", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.05 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "wsSlide", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6, bezier = "wsSlide", style = "slidevert" })
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "winIn", style = "popin 80%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "winIn", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "winOut", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "smoothIn", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "smoothIn" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 5, bezier = "smoothIn" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 4, bezier = "smoothOut" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "smoothIn" })
