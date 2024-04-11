local lsp = require 'lspconfig'
local rust = require 'rust-tools'

rust.setup{
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<leader> ", rust.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<leader>a", rust.code_action_group.code_action_group, { buffer = bufnr })
		end,
		cargo = {
			features = {"multithread"},
		},
		check = {
			command = "clippy",
		},
	},
}


