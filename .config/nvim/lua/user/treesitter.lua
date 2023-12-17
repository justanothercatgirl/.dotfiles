--! tree-sitter configuration


local ts = require 'nvim-treesitter'
local tsc = require 'nvim-treesitter.configs'

tsc.setup{
	ensure_installed = { "rust" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true, ----------------------
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1024,
	},
}
