-- this file contains setup for snippets and common LSP options

-- nvim diagnostics setup

local define_sign = function(options)
	vim.fn.sign_define(options.name, { texthl = options.name, text = options.text, numhl = options.hl })
end

define_sign({name = "DiagnosticSignError", text = '', hl = 'ErrorMsg'})
define_sign({name = "DiagnosticSignWarn", text = '', hl = 'IncSearch'})
define_sign({name = "DiagnosticSignHint", text = '', hl = 'Search'})
-- define_sign({name = "DiagnosticSignInfo", text = ''})
vim.fn.sign_define("DiagnosticSignInfo", { texthl="Ignore", text = "", numhl = 'TermCursor' })

vim.diagnostic.config{
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		source = 'always',
	},
}

vim.cmd[[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]

-- WHY THE FUCK DID THE PROTECTED CALL SOLVE THE ISSUE UGH
local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
	vim.api.nvim_err_writeln(string.format("shit! error status: %s", cmp_status))
	return
end
autopairs_cmp = require 'nvim-autopairs.completion.cmp'
luasnip = require 'luasnip'
-- require 'user.snippets'
-- luasnip.setup()

local expnoresilent = {expr = true, noremap = true, silent = true}
local noresilent = {noremap = true, silent = true}
local map = cmp.mapping
local inselect = {"i", "s"}

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
	TypeParameter = "󰅲", Crate = "󰏗"
}

-- from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local stolen_function = function() -- to check whether there are words before cursor
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local supertabforward = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		fallback()
	end
end

local supertabbackward = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end

local superenterconfirm = function(fallback)
	-- if cmp.visible and cmp.get_active_entry() then
	if cmp.visible() then
		cmp.confirm{ behavior = cmp.ConfirmBehavior.Replace, select = false }
	else
		fallback()
	end
end

cmp.setup {
	snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
	mapping = {
		["<CR>"] = map{		
			i = superenterconfirm,
			s = map.confirm{ select = true },
			c = map.confirm{ select = true },
		},
		["<Tab>"] = map(supertabforward, inselect),
		["<S-Tab>"] = map(supertabbackward, inselect),
		["<C-k>"] = map.scroll_docs(2),
		["<C-j>"] = map.scroll_docs(-2),
		["<C-l>"] = map(superenterconfirm, inselect),
		["<C-h>"] = map(function(fallback) 
			if cmp.visible() then
				cmp.close()
			else
				fallback()
			end
		end, inselect),
		["<C-n>"] = map.select_next_item(),
		["<C-p>"] = map(map.select_prev_item({ behavior = cmp.SelectBehavior.Insert })),
		["<C-Space>"] = map.confirm{ select = false }, -- setting select to true does not seem to change anything
	},
	-- NOTE: ordering or this table affects completions ordering
	sources = { 	-- TODO: Add keyword_length to some of them ??????
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'crates' },
		{ name = 'path', keyword_length = 2 },	-- will not be triggered if does not start with /
		{ name = 'nvim_lua', keyword_length = 3 },
		{ name = 'nvim_lsp_signature_help', keyword_length = 3 },
		{ name = 'calc', keyword_length = 4 },	-- I don't even know what this is
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
				crates = "[Crate]",
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

cmp.event:on( 'confirm_done', autopairs_cmp.on_confirm_done() )
