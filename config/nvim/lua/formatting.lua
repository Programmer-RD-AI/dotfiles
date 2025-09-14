local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Lua
		null_ls.builtins.formatting.stylua,

		-- Python
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.formatting.ruff,

		-- JS / TS / HTML / CSS
		null_ls.builtins.formatting.prettier,

		-- Go
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,

		-- Rust
		null_ls.builtins.formatting.rustfmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			local grp =
				vim.api.nvim_create_augroup("LspFormatting", { clear = false })
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
