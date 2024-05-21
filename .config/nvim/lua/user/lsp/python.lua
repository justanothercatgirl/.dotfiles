lsp = require 'lspconfig'

lsp.pylsp.setup {
	cmd = {"pylsp"},
	filetypes = {"py", "python"},
	root_dir = lsp.util.root_pattern("main.py", "configure", "Makefile", ".git"),
	init_options = {

	},
}
