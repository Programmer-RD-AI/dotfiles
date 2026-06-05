local H = {};

function H.get_harpoon_key()
	local branch = vim.fn.system("git branch --show-current")
	local cwd = vim.loop.cwd()
	if branch then
		cwd = cwd .. "::" .. branch
	end
	return cwd
end


return H
