local lsp = require 'lspconfig'
local rust = require 'rust-tools'

-- vim.cmd [[
-- 	autocmd FileType rust highlight link rustLifetime SpecialComment
-- ]]

-- vim.cmd [[
-- 	autocmd FileType rust setlocal inccommand=nosplit
-- ]]

-- lsp.rust_analyzer.setup{
-- 	cmd = {"rust-analyzer"},
-- 	filetypes = {"rust", "rs"},
-- 	root_dir = lsp.util.root_pattern("Cargo.toml"),
-- 	-- fucking magic
-- 	capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- 	settings =  {
-- 		["rust-analyzer"] = {
-- 			disgnostics = { enable = true },
-- 			inlayHints = { typeHints = true },
-- 		},
-- 	},
-- }

rust.setup{
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<leader> ", rust.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<leader>a", rust.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
}


