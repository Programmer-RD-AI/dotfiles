vim.g.mapleader = " "

-- File operations
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Alternate file" })

-- File explorer
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find file in explorer" })

-- Split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal split sizes" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Git
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Harpoon
vim.keymap.set("n", "<leader>ha", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon add" })
vim.keymap.set("n", "<leader>hh", function()
	local h = require("harpoon")
	h.ui:toggle_quick_menu(h:list())
end, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>h1", function()
	require("harpoon"):list():select(1)
end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<leader>h2", function()
	require("harpoon"):list():select(2)
end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<leader>h3", function()
	require("harpoon"):list():select(3)
end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<leader>h4", function()
	require("harpoon"):list():select(4)
end, { desc = "Harpoon file 4" })
vim.keymap.set("n", "<leader>hp", function()
	require("harpoon"):list():prev()
end, { desc = "Harpoon prev" })
vim.keymap.set("n", "<leader>hn", function()
	require("harpoon"):list():next()
end, { desc = "Harpoon next" })

-- Paste helpers
vim.keymap.set("n", ",p", '"0p', { desc = "Paste last yanked" })
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking selection" })

-- Terminal
vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n><cmd>ToggleTerm<CR>", { desc = "Toggle terminal (terminal mode)" })

-- File management (vim-eunuch)
vim.keymap.set("n", "<leader>rm", "<cmd>Remove %<CR>", { desc = "Remove file" })
vim.keymap.set("n", "<leader>rn", function()
	local current = vim.fn.expand("%:t")
	vim.ui.input({ prompt = "Rename to: ", default = current }, function(name)
		if name and name ~= "" and name ~= current then
			vim.cmd("Rename " .. vim.fn.shellescape(name))
		end
	end)
end, { desc = "Rename file" })
vim.keymap.set("n", "<leader>md", function()
	vim.ui.input({ prompt = "Create directory: ", default = vim.fn.expand("%:p:h") .. "/" }, function(dir)
		if dir and dir ~= "" then
			vim.cmd("Mkdir " .. vim.fn.shellescape(dir))
		end
	end)
end, { desc = "Create directory" })
vim.keymap.set("n", "<leader>ww", "<cmd>SudoWrite<CR>", { desc = "Sudo write" })

-- Window navigation (normal mode)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Window up" })

-- Window navigation (terminal mode)
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Window left" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Window right" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Window down" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Window up" })
