-- this file contains general options for nvim 

local o =  vim.opt

local options = {
	-- general options
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	mouse = "a",
	showmode = true,
	tabstop = 8,
	shiftwidth = 8,
	smartindent = true,
	swapfile = false,
	timeoutlen = 1000,	--ms
	termguicolors = true,
	updatetime = 300,	--ms
	writebackup = false,
	expandtab = false, -- !!!!!!!!!
	cursorline = false,
	number = true,
	wrap = false,
	-- splitting
	splitbelow = true,
	splitright = true,
	-- autocompletion
	completeopt = { 'menuone', 'noselect', 'noinsert' },
	-- treesitter
	foldlevel = 3,
}

for key, val in pairs(options) do
	o[key] = val
end

-- vim.cmd('colo evening')
