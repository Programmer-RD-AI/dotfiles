vim.g.mapleader = ' '

-- ═══════════════════════════════════════════════════════════════════════════
-- Basic File Operations
-- ═══════════════════════════════════════════════════════════════════════════
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {
    desc = 'Save'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- File Explorer (nvim-tree)
-- ═══════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer"
})
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {
    desc = "Toggle file explorer on current file"
})

-- ═══════════════════════════════════════════════════════════════════════════
-- Split Window Management
-- ═══════════════════════════════════════════════════════════════════════════
-- Create splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', {
    desc = 'Split window vertically'
})
vim.keymap.set('n', '<leader>sh', '<C-w>s', {
    desc = 'Split window horizontally'
})
vim.keymap.set('n', '<leader>se', '<C-w>=', {
    desc = 'Make splits equal size'
})
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', {
    desc = 'Close current split'
})

-- Navigate splits (also works with tmux via nvim-tmux-navigation)
-- NOTE: These are handled by nvim-tmux-navigation plugin for seamless tmux integration
-- vim.keymap.set('n', '<C-h>', '<C-w>h', {
--     desc = 'Go to left split'
-- })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', {
--     desc = 'Go to bottom split'
-- })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', {
--     desc = 'Go to top split'
-- })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', {
--     desc = 'Go to right split'
-- })

-- Resize splits
vim.keymap.set('n', '<leader>+', '<C-w>+', {
    desc = 'Increase split height'
})
vim.keymap.set('n', '<leader>-', '<C-w>-', {
    desc = 'Decrease split height'
})
vim.keymap.set('n', '<leader>>', '<C-w>>', {
    desc = 'Increase split width'
})
vim.keymap.set('n', '<leader><', '<C-w><', {
    desc = 'Decrease split width'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- Tab Management
-- ═══════════════════════════════════════════════════════════════════════════
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', {
    desc = 'Open new tab'
})
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', {
    desc = 'Close current tab'
})
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', {
    desc = 'Go to next tab'
})
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', {
    desc = 'Go to previous tab'
})
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', {
    desc = 'Open current buffer in new tab'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- System Clipboard Integration
-- ═══════════════════════════════════════════════════════════════════════════
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

-- ═══════════════════════════════════════════════════════════════════════════
-- Git Integration (LazyGit)
-- ═══════════════════════════════════════════════════════════════════════════
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {
    desc = 'Open LazyGit'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- Search & Find
-- ═══════════════════════════════════════════════════════════════════════════
-- Enhanced search functionality (like Ctrl+F in browsers/editors)
vim.keymap.set('n', '<leader>/', function()
    vim.ui.input({
        prompt = "Search: "
    }, function(input)
        if input and input ~= "" then
            -- Enable search highlighting for this search
            vim.opt.hlsearch = true
            -- Perform the search
            local ok, _ = pcall(vim.fn.search, input)
            if not ok then
                print("Pattern not found: " .. input)
            end
        end
    end)
end, {
    desc = 'Search within current file (enhanced Ctrl+F)'
})

-- Traditional search (fallback)
vim.keymap.set('n', '<C-f>', function()
    vim.opt.hlsearch = true
    vim.cmd('normal! /')
end, {
    desc = 'Search within current file (traditional)'
})

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {
    desc = 'Clear search highlighting'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- Comments
-- ═══════════════════════════════════════════════════════════════════════════
-- Note: Comment.nvim setup is handled in plugins.lua
-- These keymaps will work once the plugin is loaded

-- Enhanced file search with <leader>cc (like Ctrl+Shift+F in other editors)
vim.keymap.set('n', '<leader>cc', function()
    require('telescope.builtin').current_buffer_fuzzy_find()
end, {
    desc = 'Search within current file (fuzzy)'
})

-- Comment toggling with <leader>gc (mnemonic: go comment)
vim.keymap.set('n', '<leader>gc', function()
    local ok, comment_api = pcall(require, 'Comment.api')
    if ok then
        comment_api.toggle.linewise.current()
    else
        -- Fallback to built-in commenting
        vim.cmd('normal! gcc')
    end
end, {
    noremap = true,
    silent = true,
    desc = 'Toggle comment on current line'
})

vim.keymap.set('v', '<leader>gc', function()
    local ok, comment_api = pcall(require, 'Comment.api')
    if ok then
        comment_api.toggle.linewise(vim.fn.visualmode())
    else
        -- Fallback to built-in commenting
        vim.cmd('normal! gc')
    end
end, {
    noremap = true,
    silent = true,
    desc = 'Toggle comment on selected lines'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- Harpoon (Quick File Navigation)
-- ═══════════════════════════════════════════════════════════════════════════
vim.keymap.set('n', '<leader>ha', function()
    require('harpoon'):list():add()
end, {
    desc = 'Harpoon add file'
})

vim.keymap.set('n', '<leader>hh', function()
    local harpoon = require('harpoon')
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, {
    desc = 'Harpoon toggle menu'
})

-- Navigate to specific harpoon marks
vim.keymap.set('n', '<leader>h1', function()
    require('harpoon'):list():select(1)
end, {
    desc = 'Harpoon file 1'
})

vim.keymap.set('n', '<leader>h2', function()
    require('harpoon'):list():select(2)
end, {
    desc = 'Harpoon file 2'
})

vim.keymap.set('n', '<leader>h3', function()
    require('harpoon'):list():select(3)
end, {
    desc = 'Harpoon file 3'
})

vim.keymap.set('n', '<leader>h4', function()
    require('harpoon'):list():select(4)
end, {
    desc = 'Harpoon file 4'
})

-- Harpoon navigation with arrow-like keys (alternative to numbers)
vim.keymap.set('n', '<leader>hp', function()
    require('harpoon'):list():prev()
end, {
    desc = 'Harpoon previous'
})

vim.keymap.set('n', '<leader>hn', function()
    require('harpoon'):list():next()
end, {
    desc = 'Harpoon next'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- LSP Enhanced Telescope Integration
-- ═══════════════════════════════════════════════════════════════════════════
-- Add LSP-specific telescope keymaps that work when LSP is attached
vim.keymap.set('n', '<leader>fd', function()
    require('telescope.builtin').lsp_definitions()
end, {
    desc = 'Find LSP definitions'
})

vim.keymap.set('n', '<leader>fr', function()
    require('telescope.builtin').lsp_references()
end, {
    desc = 'Find LSP references'
})

vim.keymap.set('n', '<leader>fi', function()
    require('telescope.builtin').lsp_implementations()
end, {
    desc = 'Find LSP implementations'
})

vim.keymap.set('n', '<leader>fs', function()
    require('telescope.builtin').lsp_document_symbols()
end, {
    desc = 'Find document symbols'
})

vim.keymap.set('n', '<leader>fS', function()
    require('telescope.builtin').lsp_workspace_symbols()
end, {
    desc = 'Find workspace symbols'
})

-- ═══════════════════════════════════════════════════════════════════════════
-- Terminal Integration
-- ═══════════════════════════════════════════════════════════════════════════
vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm direction=float<CR>', {
    desc = 'Toggle floating terminal'
})

vim.keymap.set('t', '<C-\\>', '<C-\\><C-n><cmd>ToggleTerm<CR>', {
    desc = 'Toggle floating terminal from terminal mode'
})

-- Alternative terminal mappings in case the backslash doesn't work
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', {
    desc = 'Toggle floating terminal (alternative)'
})

vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><cmd>ToggleTerm<CR>', {
    desc = 'Toggle floating terminal from terminal mode (alternative)'
})
