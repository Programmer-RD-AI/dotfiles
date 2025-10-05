local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Lua
		null_ls.builtins.formatting.stylua,

		-- JS / TS / HTML / CSS
		null_ls.builtins.formatting.prettier,

		-- Go
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			local grp = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
			vim.api.nvim_clear_autocmds({ group = grp, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = grp,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = false,
						filter = function(c)
							return c.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("RuffFixFile", function()
	local file = vim.fn.expand("%:p")
	if file == "" then
		return
	end
	vim.cmd("write")
	vim.fn.jobstart({ "ruff", "check", "--fix", file }, { stdout_buffered = true, stderr_buffered = true })
	vim.fn.jobstart({ "ruff", "format", file }, { stdout_buffered = true, stderr_buffered = true })
	vim.cmd("edit") -- reload
end, {})

vim.keymap.set("n", "<leader>rf", ":RuffFixFile<CR>", { desc = "Ruff fix current file" })
