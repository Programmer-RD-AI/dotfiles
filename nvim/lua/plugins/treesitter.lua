local languages = {
	"bash", "c", "cpp", "css", "dockerfile", "go", "gomod", "gosum", "gowork",
	"html", "javascript", "jinja", "jinja_inline", "json", "julia", "lua", "markdown",
	"markdown_inline", "python", "query", "r", "rust", "typescript", "vim", "vimdoc",
	"xml", "yaml",
}

local install_dir = vim.fn.stdpath("data") .. "/site"

local indent_langs = {
	bash = true, c = true, cpp = true, css = true, go = true,
	html = true, javascript = true, json = true, lua = true,
	python = true, query = true, r = true, rust = true, typescript = true, vim = true,
	xml = true, yaml = true,
}

local function configure()
	require("nvim-treesitter").setup({ install_dir = install_dir })

	local group = vim.api.nvim_create_augroup("dotfiles-treesitter", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "*",
		callback = function(args)
			local ft = vim.bo[args.buf].filetype
			local lang = vim.treesitter.language.get_lang(ft)
			if not lang then return end
			if not vim.treesitter.language.add(lang) then return end
			pcall(vim.treesitter.start, args.buf, lang)
			if indent_langs[lang] then
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end,
	})
end

local function build()
	local ts = require("nvim-treesitter")
	ts.setup({ install_dir = install_dir })
	ts.install(languages, { summary = true }):wait(300000)
	ts.update(languages, { summary = true }):wait(300000)
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = build,
		config = configure,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { enable = true, max_lines = 4 },
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"fei6409/log-highlight.nvim",
		config = function()
			require("log-highlight").setup({})
		end,
	},
}
