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
		"pyright",
		"lua_ls",
		"rust_analyzer",
		"ts_ls",
		"gopls",
	},
})

local lspconfig = require("lspconfig")

local capabilities = require("blink.cmp").get_lsp_capabilities()

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

local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	-- Core navigation keymaps
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
			vim.lsp.buf.format({ async = false })
		end,
	})
end

-- Python with pyright
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				defaultInterpreterPath = getPythonPath(),
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
				indexing = true,
				typeCheckingMode = "strict",
			},
		},
	},
})

-- TypeScript/JavaScript
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Go
lspconfig.gopls.setup({
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
})

-- Rust
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
		},
	},
})

-- Lua
lspconfig.lua_ls.setup({
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
})
