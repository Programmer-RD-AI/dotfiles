# hypr

hyprland config overrides for an omarchy-based setup.

## setup

```bash
ln -sf ~/.dotfiles/hypr ~/.config/hypr
```

## structure

- `hyprland.conf` loads omarchy defaults first, then local overrides from this directory.
- `monitors.conf`, `input.conf`, `bindings.conf`, `looknfeel.conf`, `autostart.conf` hold personal overrides.
- `hypridle.conf`, `hyprlock.conf`, `hyprsunset.conf`, `xdph.conf` provide related component settings.
