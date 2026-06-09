# vs code

vim experience in vs code, matching neovim keybindings.

## setup

leader: `<space>`

**core settings**
- Font: JetBrains Mono
- Vim backend: Neovim
- Clipboard: System sync
- Format on save: Enabled

## essential bindings

**files**
- `<leader>w` → Save
- `<leader>ee` → Toggle explorer
- `<leader>ef` → Reveal file in explorer

**search**
- `<leader>ff` → Find files
- `<leader>fg` → Find in files

**splits**
- `<leader>sv/sh` → Split vertical/horizontal
- `<leader>se` → Equalize split sizes
- `<leader>sx` → Close split
- `<C-h/j/k/l>` → Navigate splits

**tabs**
- `<leader>to/tx` → Open/close tab
- `<leader>tn/tp` → Next/prev tab

**harpoon-style**
- `<leader>ha` → Pin editor
- `<leader>hh` → Show marked editors
- `<leader>h1-4` → Jump to editor 1-4
- `<leader>hp/hn` → Previous/next marked editor

**lsp**
- `gd/gr/gi` → Definition/references/implementation
- `gD` → Declaration
- `K` → Hover docs
- `<leader>rn` → Rename symbol
- `<leader>ca` → Code actions
- `<leader>D` → Type definition
- `<leader>k` → Signature help
- `<leader>fo` → Format buffer
- `<leader>of` → Show diagnostic float
- `<leader>xx` → Problems list

**file management**
- `<leader>rm` → Remove file
- `<leader>md` → New folder

**git**
- `<leader>lg` → Source control view

**terminal**
- `<C-\>` → Toggle terminal

**surround**
- `ys/cs/ds` → Add/change/delete surround

> cross-editor consistency with neovim and intellij keybindings.
