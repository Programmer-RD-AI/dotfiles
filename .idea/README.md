# intellij idea

ideavim config for jetbrains ides, matching neovim keybindings.

## setup

leader: `<space>`

**core config**
- System clipboard sync
- Line numbers (relative)
- Vim surround enabled

## essential bindings

**files**
- `<leader>w` → Save all
- `<leader>ee` → Toggle project view
- `<leader>ef` → Reveal file in project

**search**
- `<leader>ff` → Go to file
- `<leader>fg` → Find in path
- `<leader>fb` → Recent files

**splits**
- `<leader>sv/sh` → Split vertical/horizontal
- `<leader>sx` → Unsplit
- `<C-h/j/k/l>` → Navigate splits

**tabs**
- `<leader>to/tx` → Open/close tab
- `<leader>tn/tp` → Next/prev tab

**harpoon-style**
- `<leader>ha` → Add to favorites
- `<leader>h1-4` → Go to tab 1-4

**clipboard**
- `<leader>y/p` → Copy/paste system clipboard

**lsp**
- `gd/gi/gr` → Declaration/implementation/usages
- `K` → Quick docs
- `<space>rn` → Rename
- `<space>ca` → Show intentions (code actions)
- `<space>f` → Reformat code

**comments**
- `<leader>/` → Toggle comment

**git**
- `<leader>lg` → Version control view

**terminal**
- `<C-\>` → Activate terminal

**run/debug**
- `<leader>rr` → Run
- `<leader>rd` → Debug
- `<leader>bp` → Toggle breakpoint

**surround**
- `ys/cs/ds` → Add/change/delete surround

> cross-editor consistency with neovim and vs code.
## documentation verification

- last verified: 2026-08-31
- verification scope: repository docs, documented paths, and referenced local files
- verification status: passed 10/10 audit passes

