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
- `<leader>fb` → Show buffers

**splits**
- `<leader>sv/sh` → Split vertical/horizontal
- `<leader>sx` → Close split
- `<C-h/j/k/l>` → Navigate splits

**tabs**
- `<leader>to/tx` → Open/close tab
- `<leader>tn/tp` → Next/prev tab

**harpoon-style**
- `<leader>ha` → Pin editor
- `<leader>h1-4` → Jump to editor 1-4

**clipboard**
- `<leader>y/p` → Copy/paste system clipboard

**lsp**
- `gd/gr/gi` → Definition/references/implementation
- `K` → Hover docs
- `<space>rn` → Rename
- `<space>ca` → Code actions
- `<space>f` → Format

**comments**
- `<leader>/` → Toggle comment

**git**
- `<leader>lg` → Source control view

**terminal**
- `<C-\>` → Toggle terminal

**surround**
- `ys/cs/ds` → Add/change/delete surround

> cross-editor consistency with neovim and intellij keybindings.
