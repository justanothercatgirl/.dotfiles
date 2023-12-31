lsp = require 'lspconfig'

lsp.clangd.setup {
	cmd = {"clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy"},
	filetypes = {"c", "cpp", "cxx", "h", "hpp", "hxx", "inc", "objc", "objcpp"},
	root_dir = lsp.util.root_pattern("compile_commands.json", "CMakeLists.txt", "Makefile", "qmake.pro", ".git"),
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}
