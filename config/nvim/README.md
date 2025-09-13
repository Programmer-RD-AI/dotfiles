# Neovim Configuration

## Key Bindings

**Leader**: `<space>`

**Essential**
- `<leader>w` → Save file
- `<leader>ee` → File explorer
- `<leader>ff` → Find files
- `<leader>fg` → Search in files
- `<leader>/` → Search current file
- `<leader>lg` → Git UI (LazyGit)
- `<C-\>` → Terminal

**File Navigation**
- `<leader>ha` → Mark file (Harpoon)
- `<leader>hh` → Show marked files
- `<leader>h1/h2/h3/h4` → Jump to file 1/2/3/4

**Splits**
- `<leader>sv` → Split vertical
- `<leader>sh` → Split horizontal
- `<C-h/j/k/l>` → Navigate splits

**Tabs**
- `<leader>to` → New tab
- `<leader>tx` → Close tab
- `<leader>tn/tp` → Next/previous tab

**Code (LSP)**
- `gd` → Go to definition
- `gr` → Find references
- `K` → Show docs
- `<space>rn` → Rename
- `<space>ca` → Code actions
- `<space>f` → Format
- `[d/]d` → Next/prev error

**Comments**
- `<leader>gc` → Toggle comment

**File Operations**
- `<leader>rm` → Delete file
- `<leader>rn` → Rename file

## Setup

1. Open nvim - plugins auto-install
2. Run `:Mason` to install language servers
3. Use `<leader>?` to see all keybindings

## Languages Supported

Python, TypeScript/JavaScript, Go, Rust, Lua