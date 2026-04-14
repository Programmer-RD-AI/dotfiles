return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
					save_on_change = true,
					enter_on_sendcmd = false,
					tmux_autoclose_windows = false,
					excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
					mark_branch = false,
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"tpope/vim-eunuch",
		cmd = {
			"Remove", "Rename", "Move", "Chmod", "Mkdir",
			"SudoWrite", "SudoEdit", "Delete", "Copy",
			"Duplicate", "Find", "Locate", "Wall",
		},
	},
	{
		"akinsho/toggleterm.nvim",
		opts = {
			size = 20,
			open_mapping = [[<c-\>]],
			direction = "float",
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{ "github/copilot.vim" },
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
}
