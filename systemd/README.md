# systemd

user-level systemd units used by this setup.

## setup

```bash
ln -sf ~/.dotfiles/systemd/user/obsidian-sync.service ~/.config/systemd/user/obsidian-sync.service
systemctl --user daemon-reload
systemctl --user enable --now obsidian-sync.service
```

## files

- `user/obsidian-sync.service` → runs obsidian vault git sync script on session start/stop.
