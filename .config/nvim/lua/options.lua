vim.g.maplocalleader = ","
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "json", "yaml", "html", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
