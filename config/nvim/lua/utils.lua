local M = {}
local util = require("lspconfig.util")

function M.getPythonPath()
	local root = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1])
	local venv = root .. "/.venv"
	local python = venv .. "/bin/python"
	if vim.loop.os_uname().sysname:match("Windows") then
		python = venv .. "\\Scripts\\python.exe"
	end
	return python
end

function M.root_dir(fname)
	return util.root_pattern("ruff.toml", ".ruff.toml", "pyproject.toml", ".git")(fname) or util.path.dirname(fname)
end

return M
