# IntelliJ IDEA

IdeaVim config for JetBrains IDEs, matching Neovim keybindings.

## Setup

Leader: `<space>`

**Core Config**
- System clipboard sync
- Line numbers (relative)
- Vim surround enabled

## Essential Bindings

**Files**
- `<leader>w` → Save all
- `<leader>ee` → Toggle project view
- `<leader>ef` → Reveal file in project

**Search**
- `<leader>ff` → Go to file
- `<leader>fg` → Find in path
- `<leader>fb` → Recent files

**Splits**
- `<leader>sv/sh` → Split vertical/horizontal
- `<leader>sx` → Unsplit
- `<C-h/j/k/l>` → Navigate splits

**Tabs**
- `<leader>to/tx` → Open/close tab
- `<leader>tn/tp` → Next/prev tab

**Harpoon-style**
- `<leader>ha` → Add to favorites
- `<leader>h1-4` → Go to tab 1-4

**Clipboard**
- `<leader>y/p` → Copy/paste system clipboard

**LSP**
- `gd/gi/gr` → Declaration/implementation/usages
- `K` → Quick docs
- `<space>rn` → Rename
- `<space>ca` → Show intentions (code actions)
- `<space>f` → Reformat code

**Comments**
- `<leader>/` → Toggle comment

**Git**
- `<leader>lg` → Version control view

**Terminal**
- `<C-\>` → Activate terminal

**Run/Debug**
- `<leader>rr` → Run
- `<leader>rd` → Debug
- `<leader>bp` → Toggle breakpoint

**Surround**
- `ys/cs/ds` → Add/change/delete surround

> Cross-editor consistency with Neovim and VS Code.

