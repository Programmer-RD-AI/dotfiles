# Neovim

Leader: `<space>`

## File Operations

- `<leader>w` → Save
- `<leader>?` → Show buffer keymaps (which-key)
- `<Esc>` → Clear search highlight

## File Explorer

- `<leader>ee` → Toggle explorer
- `<leader>ef` → Focus current file in explorer

## Search (Telescope)

- `<leader>ff` → Find files
- `<leader>fg` → Live grep
- `<leader>fb` → Buffers
- `<leader>fh` → Help tags
- `<leader>/` → Fuzzy search in current buffer

## LSP Telescope

- `<leader>fd` → Go to definition
- `<leader>fr` → Find references
- `<leader>fi` → Find implementations
- `<leader>fs` → Document symbols
- `<leader>fS` → Workspace symbols

## LSP

- `gd` → Definition (Telescope)
- `gD` → Declaration
- `gi` → Implementation (Telescope)
- `gr` → References (Telescope)
- `K` → Hover docs
- `<C-k>` → Signature help
- `<space>rn` → Rename
- `<space>D` → Type definition
- `<space>ca` / `<leader>ca` → Code actions
- `<space>fo` → Format

## LSP Languages

| Language | Server |
|----------|--------|
| Python | `basedpyright` + `ruff` (type checking off; pyright diagnostics hidden) |
| TypeScript / JS | `ts_ls` |
| Go | `gopls` (gofumpt, staticcheck) |
| Rust | `rust_analyzer` |
| Lua | `lua_ls` |
| Java | `jdtls` |
| Terraform | `terraformls` + `tflint` |
| C / C++ | `clangd` |
| LaTeX | `texlab` |

## Format on Save (null-ls)

- Lua → stylua
- JS / TS / HTML / CSS → prettier
- Go → gofumpt + goimports
- Python → ruff (via LSP)

## Diagnostics

- `<leader>xx` → Toggle diagnostics (Trouble)
- `<leader>xX` → Buffer diagnostics (Trouble)
- `<leader>cs` → Symbols (Trouble)
- `<leader>cl` → LSP defs / refs (Trouble)
- `<leader>xL` → Location list
- `<leader>xQ` → Quickfix list
- `<leader>of` → Open floating diagnostic
- `[d` / `]d` → Prev / next diagnostic

## Python (Ruff)

- `<leader>rf` → Ruff fix current file (check + fix + format)

## Rulebook

- `<leader>ri` → Ignore diagnostic rule
- `<leader>rl` → Look up rule docs
- `<leader>ry` → Yank diagnostic code
- `<leader>rs` → Suppress formatter

## Harpoon

- `<leader>ha` → Add file
- `<leader>hh` → Toggle menu
- `<leader>h1-4` → Jump to file 1-4
- `<leader>hp` / `<leader>hn` → Prev / next

## Git

- `<leader>lg` → LazyGit

## Terminal

- `<C-\>` → Toggle floating terminal

## Splits

- `<leader>sv` → Vertical split
- `<leader>sh` → Horizontal split
- `<leader>se` → Equalize splits
- `<leader>sx` → Close split
- `<leader>+` / `<leader>-` → Increase / decrease height
- `<leader>>` / `<leader><` → Increase / decrease width
- `<C-h/j/k/l>` → Navigate splits (works from terminal mode too)

## File Management (Eunuch)

- `<leader>rm` → Remove current file
- `<leader>rn` → Rename current file
- `<leader>md` → Create directory
- `<leader>ww` → SudoWrite

## Surround

- `ys/cs/ds` → Add / change / delete surround
- `S` → Surround selection (visual)

## Paste

- `,p` → Paste last yanked (not deleted)
- `p` (visual) → Paste over selection without saving to register

> Tip: Use caps lock as escape. Run: `setxkbmap -option caps:swapescape`

