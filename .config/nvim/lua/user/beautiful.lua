-- this file contains configuration for colorschemes e.t.c 

vim.cmd("colorscheme default")

local colorscheme = "habamax"
-- local colorscheme = "evening"
local status, _retval = pcall(vim.cmd, "colo " .. colorscheme)
if not status then
	vim.notify("Error: colorscheme \"" .. colorscheme .. "\" not found!")
	return -- what the fuck lua where does this return lmao
end

