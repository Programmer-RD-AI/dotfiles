return {
	{
		"dmtrKovalenko/fff.nvim",
		build = "cargo build --release",
		config = function()
			local fff = require("fff")
			fff.setup({})
			vim.keymap.set("n", "<leader>ff", fff.find_files, { desc = "Find files (fff)" })
			vim.keymap.set("n", "<leader>fg", fff.live_grep, { desc = "Live grep (fff)" })
		end,
	},
}
