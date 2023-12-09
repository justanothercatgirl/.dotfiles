-- this file contains setup for snippets and common LSP options

local cmp_status, cmp = pcall(require, 'cmp')
-- vim.api.nvim_echo({{"Hello!", "Normal"}}, true, {})
if not cmp_status then
	vim.api.nvim_err_writeln(string.format("shit! error status: %s", cmp_status))
	return
end
luasnip = require 'luasnip'
luasnip.setup()

local expnoresilent = {expr = true, noremap = true, silent = true}
local noresilent = {noremap = true, silent = true}

-- stolen from https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
local kind_icons = {
	Text = "",	Method = "󰆧",
	Function = "󰊕",	Constructor = "",
	Field = "󰇽",	Variable = "󰂡",
	Class = "󰠱",	Interface = "",
	Module = "",	Property = "󰜢",
	Unit = "",	Value = "󰎠",
	Enum = "",	Keyword = "󰌋",
	Snippet = "",	Color = "󰏘",
	File = "󰈙",	Reference = "",
	Folder = "󰉋",	EnumMember = "",
	Constant = "󰏿",	Struct = "",
	Event = "",	Operator = "󰆕",
	TypeParameter = "󰅲",
}

-- from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local stolen_function = function() -- to check whether there are words before cursor
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- TODO: Finish
cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)	-- for vsnip (i left it)
			luasnip.lsp_expand(args.body)		-- for luasnip cause i like it more
		end,
	},
	-- NOTE: ordering or this table affects completions ordering
	sources = { 	-- TODO: Add keyword_length to some of them ??????
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp_signature_help' },
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		-- the function is also half-stolen
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s · |%s|", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[Lsp]",
				vsnip = "[Vsnip]",
				luasnip = "[Luasnip]",
				path = "[Path]",
				nvim_lua = "[Lua]",
				calc = "[󰊕(x)dx]",
				nvim_lsp_signature_help = "[Lsp-help]",
			})[entry.source.name]
			return vim_item
		end,
	},
	window = {
		completion = cmp.config.window.bordered(), 
		documentation = cmp.config.window.bordered(),
	},
	experimental = { ghost_text = true },
}

