lsp = require 'lspconfig'

-- lsp.lua.setup {
-- 	cmd = {
-- 		"/usr/bin/lua-language-server", 
-- 		"-E", "/usr/lib/lua-language-server/main.lua" 
-- 	}, 
-- 	filetypes = { "lua" },
-- 	root_dir = lsp.util.root_pattern("Makefile"),
-- 	settings = {
-- 		["lua-language-server"] = {
-- 			runtime = { version = 'LuaJIT' },
-- 			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
-- 		},
-- 	},
-- }
