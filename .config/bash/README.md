# Bash Configuration (`.config/bash`)

This folder contains all custom Bash configuration for your environment.

## Main File

- `bashrc`: Main Bash configuration file. Loaded for interactive shells.

## Key Features

- **PATH Setup**: Adds user, cargo, Anaconda, Node, and Snap binaries to your PATH.
- **Color Palette**: Defines custom colors for your prompt (Git status, user, host, path, etc.).
- **Modular Initialization**: Only loads for interactive shells.
- **Aliases & Functions**: (Add your custom aliases and functions here as needed.)

## Example Key Bindings

- You can add custom key bindings in `bashrc` using `bind` or `bind -x`.
- Example (add to `bashrc`):
  ```bash
  # Ctrl+L to clear and list files
  bind -x '"\C-l":clear;ls -la'
  ```

## Usage

- This file is symlinked to `~/.bashrc` for automatic loading.
- To reload after changes: `source ~/.bashrc`

---

**Tip:** Add aliases, functions, and keymaps here to boost your shell productivity!
