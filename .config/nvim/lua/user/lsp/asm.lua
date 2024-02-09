local lsp = require'lspconfig'

lsp.asm_lsp.setup{
	cmd = { "asm-lsp", "--stdio" },
	filetypes = { "s", "asm", "S" },
	root_dir = lsp.util.root_pattern("Makefile", ".git"),
}
