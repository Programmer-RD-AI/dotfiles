local utils = require("utils")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"ruff",
		"lua_ls",
		"rust_analyzer",
		"ts_ls",
		"gopls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

for t, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. t
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Notify when LSP attaches
	vim.notify(
		string.format("LSP %s attached to buffer %d", client.name, bufnr),
		vim.log.levels.INFO,
		{ title = "LSP" }
	)

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	-- Core navigation keymaps
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
		vim.cmd("wincmd p")
	end, { silent = true })
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

	-- Workspace management
	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wl', function()
	--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)

	-- Type and refactoring
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<space>fo", function()
		vim.lsp.buf.format({
			async = true,
		})
	end, bufopts)

	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ async = false, bufnr = bufnr })
		end,
	})
end

-- Python with ruff
vim.lsp.config.ruff = {
	cmd = { "ruff", "server" },
	root_dir = utils.root_dir,
	capabilities = capabilities,
	on_attach = on_attach,
}
vim.lsp.enable("ruff")

-- TypeScript/JavaScript
vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	on_attach = on_attach,
	capabilities = capabilities,
}
vim.lsp.enable("ts_ls")

-- Go
vim.lsp.config.gopls = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			gofumpt = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
vim.lsp.enable("gopls")

-- Rust
vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			cargo = {
				features = { "server" },
			},
		},
	},
}
vim.lsp.enable("rust_analyzer")

-- Lua
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
vim.lsp.enable("lua_ls")

-- Java
vim.lsp.config.jdtls = {
	cmd = { "jdtls" },
	filetypes = { "java" },
	on_attach = on_attach,
	capabilities = capabilities,
}
vim.lsp.enable("jdtls")
