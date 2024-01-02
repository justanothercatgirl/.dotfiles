--! tree-sitter configuration


local ts = require 'nvim-treesitter'
local tsc = require 'nvim-treesitter.configs'

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

tsc.setup{
	ensure_installed = { "rust", "cpp", "python" },
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
	fold = {
		enable = true,
	}
}
