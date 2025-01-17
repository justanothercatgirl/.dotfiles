-- this file contains plugin settings as well as initialization of lazy.nvim

-- plugins to be installed
plugins = {
	{ "folke/lazy.nvim" },				-- plugin manager

	{ "nvim-lua/popup.nvim" },			-- some functions for other plugin
	{ "nvim-lua/plenary.nvim" },			-- some functions for other plugins
	{ "folke/which-key.nvim" },			-- pretty self-descriptive name

	{ "rafi/awesome-vim-colorschemes" },		-- colorschemes
	{ "lunarvim/colorschemes" },			-- colorschemes
	{ "folke/tokyonight.nvim" },			-- colorschemes


	{ 
		"smoka7/multicursors.nvim", 
		event = "VeryLazy",
		dependencies = { 'smoka7/hydra.nvim' },
		cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
	},
	{ "tpope/vim-commentary" },			-- gc & gcc for commenting
	{ "preservim/nerdtree" },			-- file explorer
	{ 
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },		-- automatically pair brackets and quotes
	},
	{ 
		"tpope/vim-surround",			-- replace quotes e.t.c
		event = { "InsertEnter" },
	},


	{ 
		"nvim-treesitter/nvim-treesitter",	-- folding code, advanced syntax highlighting & sitting on a tree
		event = { "InsertEnter" },
	},
	{ 
		"neovim/nvim-lspconfig",		-- LSP configuration
		event = { "InsertEnter" },
	},
	{ 
		"FabijanZulj/blame.nvim",		-- git blame integration
	},
	{ "simrat39/rust-tools.nvim" },			-- no commments
	

	{ "hrsh7th/vim-vsnip" },			-- snippet engine
	{
		"L3MON4D3/LuaSnip",			-- better snippet engine
		event = { "InsertEnter" },
	},
	{
		"saadparwaiz1/cmp_luasnip", 		-- for luasnip
		event = { "InsertEnter" },
	},
	{
		"rafamadriz/friendly-snippets", 	-- predefined snippets
		event = { "InsertEnter" },
	},

	{
		"CRAG666/code_runner.nvim",		-- TODO: setup magic filenames to be executed per-project
		config = true,
	},
	{
		"akinsho/toggleterm.nvim",		-- a terminal, horaaaay
		config = true,
	},

	-- Autocompletion framework
	{ 
		"hrsh7th/nvim-cmp", 			-- the framework
		event = { "InsertEnter" },
	},
	{
		"hrsh7th/cmp-nvim-lua", 		-- lua config
		event = { "InsertEnter" },
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",	-- ?????????? a monsterature-help" 
		event = { "InsertEnter" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",			-- LSP completion
		event = { "InsertEnter" },
	},
	{
		"hrsh7th/cmp-path",			-- /mnt/D/media/audio_sync/term_download_mp3/HELLO_I_AM_EMU_OTORI.mp3
		event = { "InsertEnter" },
	},
	{
		"hrsh7th/cmp-buffer",			-- current buffer
		event = { "InsertEnter" },
	},
	{
		"hrsh7th/cmp-cmdline",			-- command line tools
		event = { "InsertEnter" },
	},
	{ 	
		"Saecki/crates.nvim",			-- rust packages from crates.io
		event = { "BufRead Cargo.toml" },
		setup = function()
			require('crates').setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",		-- tab & buffer line
		version = "*", 
		-- dependencies = 'nvim-tree/nvim-web-devicons'
		-- for more details on how to configure this plugin in details please see `:h bufferline-configuration`
	},
	-- { "lvimuser/lsp-inlayhints.nvim" }		-- saved for the better times
	
	-- DEBUGGER CONFIGURATION
	{
		"mfussenegger/nvim-dap",			-- the DAP itself
		event = { "InsertEnter" },
	},

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

-- miscellanous plugin setup
require('bufferline').setup{}
require('blame').setup{
	width = 16,
	date_format = "%H:%M:%S %Y-%m-%d",
	merge_consecutive = true,
}

require'multicursors'.setup {}
