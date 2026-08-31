# hypr

hyprland config overrides for an omarchy-based setup.

## setup

```bash
ln -sf ~/.dotfiles/hypr ~/.config/hypr
```

## structure

- `hyprland.lua` is the main entrypoint and imports omarchy defaults plus local overrides from this directory.
- `monitors.lua`, `input.lua`, `bindings.lua`, `looknfeel.lua`, `autostart.lua`, and `windows.lua` hold personal Hypr overrides.
- `hypridle.conf`, `hyprlock.conf`, `hyprsunset.conf`, and `xdph.conf` provide related component settings.
## documentation verification

- last verified: 2026-08-31
- verification scope: repository docs, documented paths, and referenced local files
- verification status: passed 10/10 audit passes

