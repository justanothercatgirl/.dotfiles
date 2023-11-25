-- this file contains general remappings for this nvim configuration

local opt = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

map("", "\\", "<Nop>", opt)
vim.g.mapleader = "\\"

-- some minor commands
map("c", "w!!", "w !sudo tee % > /dev/null", opt)

-- remap j and k
-- i refuse to elaborate
map("n", "j", "<Up>", opt)
map("n", "k", "<Down>", opt)

-- window navigation
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-j>", "<C-w>k", opt) -- SWITCHED K AND J
map("n", "<C-k>", "<C-w>j", opt) -- SWITCHED K AND J
map("n", "<C-h>", "<C-w>h", opt)

-- Insert mode navigation
map("i", "<C-h>", "<Left>", opt)
map("i", "<C-j>", "<Up>", opt)   -- SWITCHED K AND J
map("i", "<C-k>", "<Down>", opt) -- SWITCHED K AND J
map("i", "<C-l>", "<Right>", opt)

-- lexer options..?
map("n", "<leader>e", ":Lex 49<cr>", opt)

-- resizing options
map("n", "<C-Left>", ":vertical resize -5<cr>", opt)
map("n", "<C-Up>", ":resize +5<cr>", opt)
map("n", "<C-Right>", ":vertical resize +5<cr>", opt)
map("n", "<C-Down>", ":resize -5<cr>", opt)

-- better indentation
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- moving lines 
map("n", "<A-j>", ":m .-2<CR>==", opt) -- SWITCHED K AND J
map("n", "<A-k>", ":m .+1<CR>==", opt) -- SWITCHED K AND J

-- duplicating lines 
map("n", "<C-Up>", ":.,.t.-1<CR>==", opt)
map("n", "<C-Down>", ":.,.t.<CR>==", opt)

-- leader remaps
map("n", "<leader>/", ":nohlsearch<CR>", opt)	-- discard search highlighting
map("n", "<leader>T", ":term<CR>", opt)		-- open terminal fullscreen with \T
map("n", "<leader>t", ":vsplit term <CR>", opt)	-- split to terminal with \t
map("n", "<leader>pl", ":Lazy<CR>", opt)	-- open plugin manager

-- miscellaneous
map("n", "<leader>relaod", ":luafile ~/.config/nvim/lua/init.lua", {noremap = false})
