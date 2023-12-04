-- this file contains plugin settings as well as initialization of lazy.nvim


-- plugins to be installed
plugins = {
	"folke/lazy.nvim",			-- plugin manager
	"nvim-lua/popup.nvim",			-- some functions for other plugins
	"nvim-lua/plenary.nvim",		-- some functions for other plugins
	"folke/which-key.nvim",			-- pretty self-descriptive name
	"rafi/awesome-vim-colorschemes",	-- same here
	"tpope/vim-commentary",			-- gc & gcc for commenting
	"tpope/vim-surround",			-- replace quotes e.t.c
	"nvim-treesitter/nvim-treesitter",	-- folding code, advanced syntax highlighting & sitting on a tree
	"preservim/nerdtree",			-- file explorer
}

-- options for lazy
opts = {

}


-- some lazy.nvim magic
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- initialization
lazy = require("lazy")
lazy.setup(plugins, opts)
-- lazy.load('nerdtree')

