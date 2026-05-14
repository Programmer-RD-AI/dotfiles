return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"FabijanZulj/blame.nvim",
		event = "VeryLazy",
		config = function()
			require("blame").setup({
				virtual_style = "right_align",
			})
			vim.cmd("BlameToggle virtual")
		end,
		keys = {
			{ "<leader>gb", "<cmd>BlameToggle window<cr>", desc = "Toggle git blame window" },
			{ "<leader>gB", "<cmd>BlameToggle virtual<cr>", desc = "Toggle inline git blame" },
		},
	},
}
