local M = {}

function M.getPythonPath()
	local root = vim.fs.dirname(
		vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1]
	)
	local venv = root .. "/.venv"
	local python = venv .. "/bin/python"
	if vim.loop.os_uname().sysname:match("Windows") then
		python = venv .. "\\Scripts\\python.exe"
	end
	return python
end

function M.root_dir(fname)
	local markers = { "ruff.toml", ".ruff.toml", "pyproject.toml", ".git" }
	local root = vim.fs.root(fname or 0, markers)
	return root
		or vim.fn.fnamemodify(fname or vim.api.nvim_buf_get_name(0), ":p:h")
end

return M
