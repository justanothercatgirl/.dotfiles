--! tree-sitter configuration


local ts = require 'nvim-treesitter'
local tsc = require 'nvim-treesitter.configs'
local tsp = require 'nvim-treesitter.parsers'
local tsi = require 'nvim-treesitter.install'

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

tsi.compilers = { 'clang' }

vim.filetype.add{
	pattern = {[".*/hypr/.*%.conf"] = "hyprlang"},
}

tsp.get_parser_configs().hyprland = {
	install_info = {
		url = "~/src/tree-sitter-hyprlang/",
		files = {"src/parser.c"},
		branch = "master",
		requires_generate_from_grammar = false, --ligma ballse
	},
	filetype = "hyprlang",
}


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
