-- this file contains general remappings for this nvim configuration

local opt = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap
local lmap = vim.keymap.set

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

-- moving buffer
map("n", "<A-Down>", "<C-e>", opt)
map("n", "<A-Up>", "<C-y>", opt)

-- duplicating lines 
map("n", "<C-A-Up>", ":.,.t.-1<CR>==", opt)
map("n", "<C-A-Down>", ":.,.t.<CR>==", opt)

-- leader remaps
map("n", "<leader>/", ":nohlsearch<CR>", opt)				-- discard search highlighting
map("n", "<leader>pl", ":Lazy<CR>", opt)				-- open plugin manager
-- Old mappings for the terminal
-- map("n", "<leader>t", ":split<CR>:terminal<CR>:resize 4<CR>", opt)	-- open terminal fullscreen with \T
-- map("n", "<leader>T", ":vsplit<CR>:terminal<CR>", opt)			-- split to terminal with \t
map("", "<leader>t", ":ToggleTerm<CR>", opt)	-- open ToggleTerm
map("t", "<leader>t", ":ToggleTerm<CR>", opt)	-- close ToggleTerm

-- miscellaneous
map("c", "w!!", "w !sudo tee % > /dev/null", opt)

-- better G and gg
map("n", "G", "G$", opt)
map("n", "gg", "gg0", opt)

-- treesitter remaps
map("n", "<leader>h", "zC", opt)
map("n", "<leader>l", "zO", opt)
map("n", "<leader>H", "zM", opt)
map("n", "<leader>L", "zR", opt)
map("n", "<leader>f", "za", opt)

-- disgnostic remaps
lmap("n", "<leader>d", vim.diagnostic.open_float)
lmap("n", "d[", vim.diagnostic.goto_prev)
lmap("n", "d]", vim.diagnostic.goto_next)

-- Code Runner remaps
map("n", "<F5>", ":RunCode<CR>", opt)
map("n", "<F2>", ":echo 'time: ' . strftime('%c')<CR>", opt)

-- language server remaps
-- enable only after attaching language server to buffer 
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(event) 
		-- i don't know whether i should enable this
		-- vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader><C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>F', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
