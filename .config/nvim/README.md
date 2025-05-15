# Neovim Configuration (`.config/nvim`)

This folder contains all Neovim configuration files, written in Lua for a modern, modular setup.

## Main Files

- `init.lua`: Entry point, loads all modules.
- `lua/options.lua`: Editor options (line numbers, tabs, mouse, etc.).
- `lua/keymaps.lua`: All custom keymaps and shortcuts.
- `lua/plugins.lua`: Plugin management (using lazy.nvim).
- `lua/lsp.lua`: Language Server Protocol (LSP) configuration for code intelligence.
- `lazy-lock.json`: Plugin lockfile.

## Keymaps & Shortcuts

- `<leader>` is set to the spacebar.
- Common keymaps:
  - `<leader>w` — Save file
  - `<leader>ee` — Toggle file explorer
  - `<leader>lg` — Open LazyGit
  - `<leader>/` — Toggle comment (normal/visual mode)
  - Clipboard:
    - `<leader>y`/`<leader>Y` — Copy to system clipboard
    - `<leader>p`/`<leader>P` — Paste from system clipboard
- Telescope:
  - `<leader>ff` — Find files
  - `<leader>fh` — Find help tags

## Plugins

- Managed with [lazy.nvim](https://github.com/folke/lazy.nvim)
- Notable plugins:
  - `nvim-tree` (file explorer)
  - `telescope.nvim` (fuzzy finder)
  - `mason.nvim` & `mason-lspconfig.nvim` (LSP installer)
  - `nvim-lspconfig` (LSP setup)
  - `Comment.nvim` (comment toggling)
  - `github/copilot.vim` (AI code suggestions)

## LSP

- Preconfigured for Python (`pylsp`), Lua (`lua_ls`), and Rust (`rust_analyzer`).
- Custom `on_attach` for LSP keymaps and diagnostics.

## Usage

- Launch with `nvim`.
- All settings and keymaps are modular and easy to extend.

---

**Tip:** See `lua/keymaps.lua` for all custom shortcuts. Tweak or add your own for maximum productivity!
