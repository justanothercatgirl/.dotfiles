lsp = require 'lspconfig'

vim.cmd [[
	autocmd FileType rust highlight link rustLifetime SpecialComment
]]

vim.cmd [[
	autocmd FileType rust setlocal inccommand=nosplit
]]

lsp.rust_analyzer.setup{
	cmd = {"rust-analyzer"},
	filetypes = {"rust", "rs"},
	root_dir = lsp.util.root_pattern("Cargo.toml"),
	-- fucking magic
	capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings =  {
		["rust-analyzer"] = {
			disgnostics = { enable = false },
			inlayHints = { typeHints = true },
		},
	},
}



