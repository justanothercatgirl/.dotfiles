-- this file contains plugin settings as well as initialization of lazy.nvim

-- plugins to be installed
plugins = {
	{ "folke/lazy.nvim" },			-- plugin manager
	-- "williamboman/mason.nvim",		-- plugin manager for LSP
	-- "williamboman/mason-lspconfig.nvim",	-- mason add-ons for lspconfig

	{ "nvim-lua/popup.nvim" },		-- some functions for other plugins
	{ "nvim-lua/plenary.nvim" },		-- some functions for other plugins
	{ "folke/which-key.nvim" },		-- pretty self-descriptive name

	{ "rafi/awesome-vim-colorschemes" },	-- colorschemes
	{ "lunarvim/colorschemes" },		-- colorschemes
	{ "folke/tokyonight.nvim" },		-- colorschemes

	{ "tpope/vim-commentary" },		-- gc & gcc for commenting
	{ "tpope/vim-surround" },		-- replace quotes e.t.c
	{ "preservim/nerdtree" },		-- file explorer

	{ "nvim-treesitter/nvim-treesitter" },	-- folding code, advanced syntax highlighting & sitting on a tree
	{ "neovim/nvim-lspconfig" },		-- LSP configuration
	
	-- { "hrsh7th/vim-vsnip" },		-- snippet engine
	{ "L3MON4D3/LuaSnip" },			-- better snippet engine
	{ "saadparwaiz1/cmp_luasnip" },		-- for luasnip
	{ "rafamadriz/friendly-snippets" },	-- predefined snippets

	-- Autocompletion framework
	{ "hrsh7th/nvim-cmp" },			-- the framework
	{ "hrsh7th/cmp-nvim-lua" },		-- lua config
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },	-- ?????????? a monster
	{ "hrsh7th/cmp-nvim-lsp" },		-- LSP completion
	{ "hrsh7th/cmp-path" },			-- /mnt/D/media/audio_sync/term_download_mp3/HELLO_I_AM_EMU_OTORI.mp3
	{ "hrsh7th/cmp-buffer" },		-- current buffer
	{ "hrsh7th/cmp-cmdline" },		-- command line tools
	{ "Saecki/crates.nvim" },		-- rust packages from crates.io

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

