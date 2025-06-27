# Neovim Configuration (`.config/nvim`)

This folder contains all Neovim configuration files, written in Lua for a modern, modular setup with comprehensive LSP support.

## Main Files

- `init.lua`: Entry point, loads all modules.
- `lua/options.lua`: Editor options (line numbers, tabs, mouse, etc.).
- `lua/keymaps.lua`: All custom keymaps and shortcuts.
- `lua/plugins.lua`: Plugin management (using lazy.nvim).
- `lua/lsp.lua`: Language Server Protocol (LSP) configuration for code intelligence.
- `lua/theme.lua`: Theme and visual appearance configurations.
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

## Complete Keymap Reference 📋

**Leader Key**: `<space>` (spacebar)

### ⚡ Quick Reference Table

| Category     | Mapping      | Action           | Description                              |
| ------------ | ------------ | ---------------- | ---------------------------------------- |
| **Basic**    | `<leader>w`  | Save             | Save current file                        |
| **Search**   | `<leader>/`  | Find in file     | Search within current file (like Ctrl+F) |
| **Search**   | `<C-f>`      | Find in file     | Alternative search within file           |
| **Explorer** | `<leader>ee` | Toggle explorer  | Toggle file explorer                     |
| **Explorer** | `<leader>ef` | Find in explorer | Toggle explorer focused on current file  |
| **Terminal** | `<C-\>`      | Terminal         | Toggle floating terminal                 |
| **Terminal** | `<leader>tt` | Terminal         | Alternative floating terminal toggle     |
| **Git**      | `<leader>lg` | LazyGit          | Open LazyGit interface                   |
| **Help**     | `<leader>?`  | Which-key        | Show buffer-local keymaps guide          |

### 📁 File & Project Navigation

#### File Explorer (nvim-tree)

- `<leader>ee` — Toggle file explorer
- `<leader>ef` — Toggle file explorer focused on current file

#### Telescope (Fuzzy Finder)

- `<leader>ff` — Find files
- `<leader>fg` — Live grep (search in all files)
- `<leader>fb` — List open buffers
- `<leader>fh` — Find help tags

#### Harpoon (Quick File Marking)

- `<leader>ha` — Add current file to harpoon
- `<leader>hh` — Toggle harpoon quick menu
- `<leader>h1` to `<leader>h4` — Jump to harpoon files 1-4
- `<leader>hp` — Previous harpoon file
- `<leader>hn` — Next harpoon file

### 🔍 Search & Find

- `<leader>/` — Search within current file (enhanced Ctrl+F)
- `<C-f>` — Alternative search within current file
- `<leader>ff` — Find files (Telescope)
- `<leader>fg` — Find in files / Live grep (Telescope)
- `<leader>fb` — Find buffers (Telescope)
- `<leader>fh` — Find help tags (Telescope)

### 🪟 Window & Split Management

#### Creating & Managing Splits

- `<leader>sv` — Split window vertically
- `<leader>sh` — Split window horizontally
- `<leader>se` — Make splits equal size
- `<leader>sx` — Close current split

#### Navigating Splits (works with tmux!)

- `<C-h>` — Move to left split
- `<C-j>` — Move to bottom split
- `<C-k>` — Move to top split
- `<C-l>` — Move to right split

#### Resizing Splits

- `<leader>+` — Increase split height
- `<leader>-` — Decrease split height
- `<leader>>` — Increase split width
- `<leader><` — Decrease split width

### 📑 Tab Management

- `<leader>to` — Open new tab
- `<leader>tx` — Close current tab
- `<leader>tn` — Go to next tab
- `<leader>tp` — Go to previous tab
- `<leader>tf` — Open current buffer in new tab

### 📋 System Clipboard Integration

- `<leader>y` — Copy to system clipboard
- `<leader>Y` — Copy to system clipboard (alternative)
- `<leader>p` — Paste from system clipboard
- `<leader>P` — Paste from system clipboard (alternative)

### 💬 Comments

- `<leader>cc` — Toggle comment (works in normal and visual mode)

### 🔧 LSP (Code Intelligence)

#### Navigation

- `gd` — Go to definition
- `gD` — Go to declaration
- `gi` — Go to implementation
- `gr` — Show references
- `K` — Show hover documentation
- `<C-k>` — Show signature help

#### Diagnostics & Errors

- `<space>e` — Show diagnostics in floating window
- `[d` — Go to previous diagnostic
- `]d` — Go to next diagnostic
- `<space>q` — Show diagnostics in location list

#### Refactoring & Code Actions

- `<space>rn` — Rename symbol
- `<space>ca` — Code actions (auto-import, quick fixes)
- `<space>f` — Format code
- `<space>D` — Go to type definition

#### Workspace Management

- `<space>wa` — Add workspace folder
- `<space>wr` — Remove workspace folder
- `<space>wl` — List workspace folders

#### Telescope LSP Integration

- `<leader>fd` — Find LSP definitions
- `<leader>fr` — Find LSP references
- `<leader>fi` — Find LSP implementations
- `<leader>fs` — Find document symbols
- `<leader>fS` — Find workspace symbols

### 🖥️ Terminal Integration

- `<C-\>` — Toggle floating terminal
- `<leader>tt` — Alternative floating terminal toggle
- (In terminal) `<C-\>` — Exit terminal mode and close terminal
- (In terminal) `<leader>tt` — Alternative exit terminal mode

### 🔀 Git Integration

- `<leader>lg` — Open LazyGit interface

### ❓ Help & Discovery

- `<leader>?` — Show buffer-local keymaps (which-key guide)
- Most leader sequences will show helpful popups after a brief delay

---

## 🎯 Pro Tips for Efficiency

**Navigation Workflow:**

1. Use Harpoon (`<leader>ha`, `<leader>h1-4`) for your 4 most important files
2. Use Telescope (`<leader>ff`, `<leader>fg`) for broader file exploration
3. Use LSP navigation (`gd`, `gr`) for code jumping
4. Use `<C-o>` and `<C-i>` to navigate jump history

**Multi-file Editing:**

1. Open splits with `<leader>sv/sh`
2. Navigate with `<C-h/j/k/l>` (works with tmux!)
3. Use floating terminal `<C-\>` for quick commands
4. Balance splits with `<leader>se`

## LSP (Language Server Protocol) Features

### Language Servers Configured

- **Python**: `pyright` (advanced type checking and IntelliSense)
- **TypeScript/JavaScript**: `tsserver`
- **Go**: `gopls`
- **Rust**: `rust_analyzer` with clippy integration
- **Lua**: `lua_ls` with Neovim-specific configuration

### Python Development Setup

For optimal Python development:

1. **Activate your virtual environment** before launching Neovim
2. **Install packages in your environment** so LSP can see them
3. **Use pyright** for superior type checking and completion
4. **Example workflow:**

   ```bash
   cd your-project
   source venv/bin/activate  # or conda activate env-name
   nvim your_file.py
   ```

## Plugins

Managed with [lazy.nvim](https://github.com/folke/lazy.nvim)

### Core Functionality

- `nvim-tree` — File explorer with icons
- `telescope.nvim` — Fuzzy finder for files, buffers, LSP symbols
- `harpoon` — Lightning-fast file marking and navigation
- `mason.nvim` & `mason-lspconfig.nvim` — LSP installer and configuration
- `nvim-lspconfig` — Language server setup for code intelligence
- `Comment.nvim` — Easy comment toggling
- `github/copilot.vim` — AI code suggestions
- `toggleterm.nvim` — Better terminal integration
- `lazygit.nvim` — Git integration with LazyGit
- `lualine.nvim` — Enhanced status line
- `which-key.nvim` — Interactive keymap guide
- `nvim-tmux-navigation` — Seamless navigation between Neovim and tmux

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

## Advanced Features

### Harpoon Workflows

**Typical Harpoon Setup:**

1. Open your main files (e.g., `main.py`, `config.py`, `test.py`)
2. In each file, press `<leader>ha` to add to Harpoon
3. Use `<leader>hh` to see your marked files
4. Jump instantly with `<leader>h1`, `<leader>h2`, etc.

**Multi-project Benefits:**

- Marks are saved per project (separate `.harpoon` files)
- Marks auto-update when you edit files
- Much faster than fuzzy finding for your core files
- Integrates seamlessly with other navigation tools

### Tree-sitter Benefits

Tree-sitter provides superior syntax highlighting by using a concrete syntax tree (CST):

- **More accurate highlighting** — No regex edge cases
- **Consistent across languages** — Common elements look the same
- **Performance improvements** — Efficient handling of large files
- **Structural understanding** — Understands code structure, not just patterns
- **Advanced features** — Enables refactoring, code folding, and text objects

### Split Window Workflows

**Typical Development Setup:**

1. `:split` or `<leader>sh` — Create horizontal split for terminal
2. `:vsplit` or `<leader>sv` — Create vertical split for file explorer
3. `<C-h/j/k/l>` — Navigate between splits
4. `<leader>se` — Equalize split sizes

**Example Multi-file Editing:**

```text
┌─────────────┬─────────────┐
│  main.py    │ explorer    │
├─────────────┼─────────────┤
│  tests.py   │ terminal    │
└─────────────┴─────────────┘
```

### LSP Code Intelligence

**Go to Definition Workflow:**

1. Place cursor on function/variable
2. Press `gd` — Jump to definition
3. Press `<C-o>` — Jump back to previous location
4. Use `gr` — See all references
5. Use `<leader>fr` — Fuzzy search through references

**Refactoring Workflow:**

1. Place cursor on symbol to rename
2. Press `<space>rn` — Rename symbol
3. Type new name
4. Press Enter — All references updated

## Installation & Usage

1. **Install Neovim** (>= 0.8.0)
2. **Clone this config** to `~/.config/nvim/`
3. **Launch Neovim** — Plugins will auto-install
4. **Run `:Mason`** to install language servers
5. **Run `:Lazy`** to manage plugins

### Essential Commands

- `:Mason` — Install/manage language servers
- `:Lazy` — Manage plugins
- `:Lazy update` — Update all plugins
- `:checkhealth` — Diagnose configuration issues
- `:LspInfo` — Show LSP status for current buffer

## Tips & Tricks

**Pro Navigation:**

- Use Harpoon (`<leader>ha`, `<leader>h1-4`) for your most important files
- Use Telescope (`<leader>ff`, `<leader>fg`) for broader exploration
- Use `<C-o>` and `<C-i>` to navigate jump history
- Combine LSP navigation with Telescope for powerful code exploration

**Efficient Editing:**

- Master split windows for multi-file editing
- Use `<leader>/` for quick in-file search (like Ctrl+F)
- Leverage `<space>ca` for code actions (auto-imports, quick fixes)

**Terminal Integration:**

- Use `<C-\>` for floating terminal (or `<leader>tt` if backslash doesn't work)
- Navigate seamlessly between terminal and editor splits
- Use LazyGit (`<leader>lg`) for visual git operations

---

**Tip:** Run `:Lazy update` and `:Mason update` periodically to keep everything current!

## Cross-Editor Compatibility

This Neovim configuration is designed to work harmoniously with VS Code (via Vim extension) and IntelliJ IDEA (via IdeaVim). Key bindings are consistent across all three editors for a seamless development experience.

### Unified Keybindings Across Editors

**Core Navigation** (works in Neovim, VS Code, IntelliJ):

- `<space>` — Leader key
- `gd`, `gr`, `gi` — LSP navigation
- `<leader>ff`, `<leader>fg` — File finding
- `<leader>ee`, `<leader>ef` — File explorer
- `<space>e`, `[d`, `]d` — Diagnostics navigation

**Split Management** (consistent across all):

- `<leader>sv/sh` — Create splits
- `<C-h/j/k/l>` — Navigate splits
- `<leader>+/-/>/<` — Resize splits

**File Operations** (unified approach):

- `<leader>w` — Save file
- `<leader>y/p` — System clipboard
- `<leader>/` — Find in file (enhanced search)

### Editor-Specific Features

**Neovim Exclusive:**

- Harpoon file marking (`<leader>ha`, `<leader>h1-4`)
- Tree-sitter syntax highlighting
- Native LSP with superior completion

**VS Code Integration:**

- Pinned tabs simulate Harpoon behavior
- Full extension ecosystem compatibility
- Integrated terminal and debugging

**IntelliJ Integration:**

- Favorites system for file marking
- Advanced refactoring tools
- Database integration (`<leader>db`)
