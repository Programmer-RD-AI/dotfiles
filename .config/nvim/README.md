# Neovim Configuration (`.config/nvim`)

This folder contains all Neovim configuration files, written in Lua for a modern, modular setup.

## Main Files

- `init.lua`: Entry point, loads all modules.
- `lua/options.lua`: Editor options (line numbers, tabs, mouse, etc.).
- `lua/keymaps.lua`: All custom keymaps and shortcuts.
- `lua/plugins.lua`: Plugin management (using lazy.nvim).
- `lua/lsp.lua`: Language Server Protocol (LSP) configuration for code intelligence.
- `lazy-lock.json`: Plugin lockfile.

## Editor Options

- Line numbers enabled
- Mouse support in all modes (`mouse='a'`)
- Case-sensitive search (`ignorecase=false`, `smartcase=false`)
- No search highlighting (`hlsearch=false`)
- Soft wrapping with indent preservation (`wrap=true`, `breakindent=true`)
- Tab settings: 2 spaces (`tabstop=2`, `shiftwidth=2`, `expandtab=true`)
- True color terminal support (`termguicolors=true`)
- Improved completion menu (`completeopt={'menu', 'menuone', 'noselect'}`)
- Local leader set to comma (`,`)

## Keymaps & Shortcuts

- `<leader>` is set to the spacebar.
- Common keymaps:
  - `<leader>w` — Save file
  - `<leader>ee` — Toggle file explorer
  - `<leader>ef` — Toggle file explorer focused on current file
  - `<leader>lg` — Open LazyGit
  - `<leader>/` — Toggle comment (normal/visual mode)
  - `<leader>?` — Show buffer-local keymaps (which-key)
  - Clipboard:
    - `<leader>y` — Copy to system clipboard
    - `<leader>Y` — Copy to system clipboard (alternative)
    - `<leader>p` — Paste from system clipboard
    - `<leader>P` — Paste from system clipboard (alternative)
- Telescope:
  - `<leader>ff` — Find files
  - `<leader>fg` — Live grep (search file content)
  - `<leader>fb` — List buffers
  - `<leader>fh` — Find help tags
- Terminal:
  - `<Ctrl-\>` — Toggle floating terminal

### LSP Keymaps

- Diagnostics:
  - `<space>e` — Show diagnostics in a floating window
  - `[d` — Go to previous diagnostic
  - `]d` — Go to next diagnostic
  - `<space>q` — Show diagnostics in location list
- Code Navigation:
  - `gD` — Go to declaration
  - `gd` — Go to definition
  - `K` — Show hover information
  - `gi` — Go to implementation
  - `<C-k>` — Show signature help
  - `gr` — Show references
- Workspace Management:
  - `<space>wa` — Add workspace folder
  - `<space>wr` — Remove workspace folder
  - `<space>wl` — List workspace folders
- Refactoring:
  - `<space>D` — Go to type definition
  - `<space>rn` — Rename symbol
  - `<space>ca` — Code action
  - `<space>f` — Format code

## Plugins

- Managed with [lazy.nvim](https://github.com/folke/lazy.nvim)
- Core Functionality:
  - `nvim-tree` — File explorer with icons
  - `telescope.nvim` — Fuzzy finder for files, buffers, and more
  - `mason.nvim` & `mason-lspconfig.nvim` — LSP installer and configuration
  - `nvim-lspconfig` — Language server setup for code intelligence
  - `Comment.nvim` — Easy comment toggling with `<leader>/`
  - `github/copilot.vim` — AI code suggestions
  - `toggleterm.nvim` — Better terminal integration
  - `lazygit.nvim` — Git integration with LazyGit
  - `lualine.nvim` — Enhanced status line
  - `which-key.nvim` — Interactive keymap guide that shows available key bindings

### Code Highlighting & Enhancement

- `nvim-treesitter` — Advanced syntax highlighting using Tree-sitter
- `nvim-treesitter-context` — Shows code context (function/class names) at the top
- `log-highlight.nvim` — Specialized highlighting for log files
- `nvim-colorizer.lua` — Inline color previews for hex/RGB values
- `document-color.nvim` — LSP-based color highlighting for CSS/Tailwind
- `nvim-treesitter-refactor` — Additional Tree-sitter features for refactoring
- `vim-moonfly-colors` — Color scheme

### Completion & Snippets

- `blink.cmp` — Fast and customizable completion engine
  - Configuration includes LSP, path, snippet, and buffer sources
  - Uses 'mono' nerd font variant

### Discord Integration

- `presence.nvim` — Discord rich presence integration
  - Shows editing status, workspace, and file information
  - Customized text for different activities

## LSP

- Managed with Mason and mason-lspconfig for easy installation
- Preconfigured LSP servers:
  - `pylsp` — Python Language Server
  - `lua_ls` — Lua Language Server
  - `rust_analyzer` — Rust Language Server with clippy integration
- Custom `on_attach` function for consistent keymaps across language servers
- Enhanced diagnostics configuration with convenient navigation
- Supports core LSP features:
  - Code completion
  - Go to definition/declaration
  - Find references
  - Code actions and refactoring
  - Hover documentation
  - Signature help
  - Workspace symbol management
  - Code formatting

## Usage

- Launch with `nvim`.
- All settings and keymaps are modular and easy to extend.
- Use `:Mason` to install additional language servers.
- Use `:Lazy` to manage plugins.

## Tree-sitter Benefits

Tree-sitter provides superior syntax highlighting by using a concrete syntax tree (CST) for each file. This delivers several advantages over traditional regex-based highlighting:

- **More accurate highlighting** — No more edge case issues with regex highlighting
- **Consistent across languages** — Common elements look the same across different languages
- **Performance improvements** — More efficient and handles large files better
- **Structural understanding** — Tree-sitter understands code structure, not just patterns
- **Advanced features** — Enables features like refactoring, code folding, and text objects

The configured Tree-sitter setup includes auto-installation of language parsers for:
C, Lua, Vim, VimDoc, Query, JavaScript, TypeScript, Python, HTML, CSS, JSON, YAML, Bash, Markdown

---

**Tip:** Run `:Lazy update` periodically to keep your plugins up to date.
