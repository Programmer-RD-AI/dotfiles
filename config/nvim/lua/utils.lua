local M = {}

function M.getPythonPath()
	local root = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1])
	local venv = root .. "/.venv"
	local python = venv .. "/bin/python"
	if vim.loop.os_uname().sysname:match("Windows") then
		python = venv .. "\\Scripts\\python.exe"
	end
	return python
end

return M
