return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					comments = true,
					operators = false,
					folds = true,
				},
			})
			vim.o.background = "dark"
			vim.cmd("colorscheme gruvbox")
		end,
	},
{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { side = "right", width = 30 },
			})
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("dashboard").setup({})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = true,
				css = true,
				css_fn = true,
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			require("transparent").setup({ exclude_groups = {} })
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		end,
	},
}
