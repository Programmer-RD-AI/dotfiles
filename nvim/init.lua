require("options")
require("keymaps")

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup({ import = "plugins" }, {
	checker = { enabled = false },
	change_detection = { enabled = false },
})

require("lsp")
