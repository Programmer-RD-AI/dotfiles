# Neovim Configuration

## Key Bindings

**Leader**: `<space>`

### Essential
- `<leader>w` → Save file
- `<leader>?` → Show buffer local keymaps (which-key)

### File Explorer
- `<leader>ee` → Toggle file explorer
- `<leader>ef` → Toggle file explorer on current file

### Search
- `<leader>ff` → Find files (Telescope)
- `<leader>fg` → Search in files (Telescope)
- `<leader>fb` → Find buffers (Telescope)
- `<leader>fh` → Find help tags (Telescope)
- `<leader>/` → Search current file (Telescope)
- `<Esc>` → Clear search highlighting

### Window Management (Splits & Tabs)
- `<leader>sv` → Split vertical
- `<leader>sh` → Split horizontal
- `<leader>se` → Make splits equal size
- `<leader>sx` → Close current split
- `<leader>to` → New tab
- `<leader>tx` → Close tab
- `<leader>tn/tp` → Next/previous tab
- `<leader>tf` → Open current buffer in new tab
- `<C-h/j/k/l>` → Navigate splits

### Terminal
- `<C-\>` → Toggle floating terminal

### Git
- `<leader>lg` → Git UI (LazyGit)

### Harpoon (File Bookmarking)
- `<leader>ha` → Mark file
- `<leader>hh` → Show marked files
- `<leader>h1/h2/h3/h4` → Jump to file 1/2/3/4
- `<leader>hp` → Go to previous marked file
- `<leader>hn` → Go to next marked file

### LSP & Code
- `gd` → Go to definition
- `gr` → Find references
- `K` → Show docs (hover)
- `<leader>rn` → Rename
- `<leader>ca` → Code actions
- `<leader>f` → Format
- `[d`/`]d` → Next/previous error
- `<leader>fd` → Find LSP definitions (Telescope)
- `<leader>fr` → Find LSP references (Telescope)
- `<leader>fi` → Find LSP implementations (Telescope)
- `<leader>fs` → Find document symbols (Telescope)
- `<leader>fS` → Find workspace symbols (Telescope)

### Trouble (Diagnostics)
- `<leader>xx` → Toggle diagnostics
- `<leader>xX` → Toggle buffer diagnostics
- `<leader>cs` → Toggle symbols
- `<leader>cl` → Toggle LSP definitions/references
- `<leader>xL` → Toggle location list
- `<leader>xQ` → Toggle quickfix list

### Comments
- `<leader>gc` → Toggle comment

### Surround
- `ys` → Add surrounding
- `cs` → Change surrounding
- `ds` → Delete surrounding
- `S` → Surround selection (visual mode)

### File Operations
- `<leader>rm` → Delete file
- `<leader>rn` → Rename file
- `<leader>md` → Create directory
- `<leader>ww` → Write file with sudo