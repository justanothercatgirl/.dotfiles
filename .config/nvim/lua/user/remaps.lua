-- this file contains general remappings for this nvim configuration

local opt = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

map("", "\\", "<Nop>", opt)
vim.g.mapleader = "\\"


-- remap j and k
-- I refuse to elaborate
map("n", "j", "<Up>", opt)
map("n", "k", "<Down>", opt)
map("n", "dj", "d<Up>", opt)
map("n", "dk", "d<Down>", opt)
map("v", "j", "<Up>", opt)
map("v", "k", "<Down>", opt)

-- window navigation
map("n", "<C-j>", "<C-w>k", opt) -- SWITCHED K AND J
map("n", "<C-k>", "<C-w>j", opt) -- SWITCHED K AND J
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-h>", "<C-w>h", opt)

-- buffer navigation
map("n", "gn", ":bn<Cr>", opt)
map("n", "gp", ":bp<Cr>", opt)

-- Insert mode navigation
map("i", "<C-h>", "<Left>", opt)
map("i", "<C-j>", "<Up>", opt)   -- SWITCHED K AND J
map("i", "<C-k>", "<Down>", opt) -- SWITCHED K AND J
map("i", "<C-l>", "<Right>", opt)
map("i", "<C-w>", "<Esc>wi", opt)
map("i", "<C-W>", "<Esc>Wi", opt)
map("i", "<C-b>", "<Esc>bi", opt)
map("i", "<C-B>", "<Esc>Bi", opt)

-- Terminal mode
map("t", "<Esc>", "<C-\\><C-n>" , opt)

-- lexer options..?
map("n", "<leader>e", ":NERDTreeToggle<CR>", opt)

-- resizing options
map("n", "<C-Left>", ":vertical resize -4<cr>", opt)
map("n", "<C-Up>", ":resize +1<cr>", opt)
map("n", "<C-Right>", ":vertical resize +4<cr>", opt)
map("n", "<C-Down>", ":resize -1<cr>", opt)

-- better indentation
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- moving lines 
map("n", "<A-j>", ":m .-2<CR>==", opt) -- SWITCHED K AND J
map("n", "<A-k>", ":m .+1<CR>==", opt) -- SWITCHED K AND J

-- duplicating lines 
map("n", "<C-A-Up>", ":.,.t.-1<CR>==", opt)
map("n", "<C-A-Down>", ":.,.t.<CR>==", opt)

-- leader remaps
map("n", "<leader>/", ":nohlsearch<CR>", opt)				-- discard search highlighting
map("n", "<leader>t", ":split<CR>:terminal<CR>:resize 4<CR>", opt)	-- open terminal fullscreen with \T
map("n", "<leader>T", ":vsplit<CR>:terminal<CR>", opt)			-- split to terminal with \t
map("n", "<leader>pl", ":Lazy<CR>", opt)				-- open plugin manager

-- miscellaneous
map("c", "w!!", "w !sudo tee % > /dev/null", opt)

-- better G and gg
map("n", "G", "G$", opt)
map("n", "gg", "gg0", opt)

