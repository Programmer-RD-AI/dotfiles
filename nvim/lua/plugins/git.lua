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
		config = function()
			require("blame").setup({})
		end,
		keys = {
			{ "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle git blame" },
		},
	},
}
