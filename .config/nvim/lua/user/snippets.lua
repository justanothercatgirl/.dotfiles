local luasnip = require 'luasnip'

local text = luasnip.text_node
local snip = luasnip.snippet

-- local snippets = {
-- 	rust = { 
-- 		constant_string = snip({
-- 			trig = "pubconst",
-- 			namr = "define a string constant",
-- 			dscr = "I am too lazy",
-- 		},
-- 		text { "pub const ${1:name}: &str = \"${2:text}\";", }
-- 		)
-- 	},
-- }

luasnip.add_snippets(snippets)
