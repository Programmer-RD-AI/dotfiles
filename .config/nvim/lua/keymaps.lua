vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {
    desc = 'Save'
})

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer"
})

vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {
    desc = "Toggle file explorer on current file"
})

vim.keymap.set({'n', 'v'}, '<leader>p', '"*p', {
    desc = 'Paste from system clipboard'
})
vim.keymap.set({'n', 'v'}, '<leader>P', '"+p', {
    desc = 'Paste from system clipboard (alternative)'
})
vim.keymap.set({'n', 'v'}, '<leader>y', '"*y', {
    desc = 'Copy to system clipboard'
})
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+y', {
    desc = 'Copy to system clipboard (alternative)'
})

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {
    desc = 'Open LazyGit'
})

-- 1. Ensure Comment.nvim is loaded and set up with its default mappings:
require('Comment').setup()

-- 2. Remap <leader>/ in Normal mode to toggle comment on the current line:
vim.keymap.set('n', '<leader>/', function() -- Changed from <C-_>
    require('Comment.api').toggle.linewise.current()
end, {
    noremap = true,
    silent = true
})

-- 3. Remap <leader>/ in Visual mode to toggle comment on the selected lines:
vim.keymap.set('v', '<leader>/', function() -- Changed from <C-_>
    -- `vim.fn.visualmode()` tells Comment.nvim whether the selection was charwise, linewise, etc.
    require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, {
    noremap = true,
    silent = true
})
