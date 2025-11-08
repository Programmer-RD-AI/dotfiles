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
		"basedpyright",
		"lua_ls",
		"rust_analyzer",
		"ts_ls",
		"gopls",
		"terraformls",
		"ruff",
		"ruff-lsp",
		"tflint",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.offsetEncoding = { "utf-16" }

local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},
	virtual_text = {
		source = "if_many",
		format = function(diagnostic)
			if diagnostic.source == "pyright" or diagnostic.source == "basedpyright" then
				return nil
			end
			if diagnostic.source == "ruff" then
				return string.format("%s [%s]", diagnostic.message, diagnostic.code or "")
			end
			return diagnostic.message
		end,
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	if client and (client.name == "pyright" or client.name == "basedpyright") then
		return
	end
	original_handler(err, result, ctx, config)
end

local on_attach = function(client, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	local bufopts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	local function center_after()
		vim.schedule(function()
			vim.cmd("normal! zz")
		end)
	end

	vim.keymap.set("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
		center_after()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP: Go to definition" }))

	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
		center_after()
	end, bufopts)

	vim.keymap.set("n", "gi", function()
		require("telescope.builtin").lsp_implementations()
		center_after()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP: Go to implementation" }))

	vim.keymap.set("n", "gr", function()
		require("telescope.builtin").lsp_references()
		center_after()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP: Go to references" }))

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
		vim.cmd("wincmd p")
	end, { silent = true })
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

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

vim.lsp.config.ruff = {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		"ruff.toml",
		".ruff.toml",
		"pyproject.toml",
		"setup.py",
		".git",
	},
	capabilities = capabilities,
	on_attach = on_attach,
}
vim.lsp.enable("ruff")

vim.lsp.config.basedpyright = {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyrightconfig.json",
		"pyproject.toml",
		"setup.py",
		".git",
	},
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "off",
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
		python = {
			analysis = {
				typeCheckingMode = "off",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
vim.lsp.enable("basedpyright")

vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	on_attach = on_attach,
	capabilities = capabilities,
}
vim.lsp.enable("ts_ls")

vim.lsp.config.gopls = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", "go.work", ".git" },
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

vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", ".git" },
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

vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		".git",
	},
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

vim.lsp.config.jdtls = {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = { "pom.xml", "build.gradle", ".git" },
	on_attach = on_attach,
	capabilities = capabilities,
}
vim.lsp.enable("jdtls")

vim.lsp.config.terraformls = {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "tf", "hcl" },
}
vim.lsp.enable("terraformls")
