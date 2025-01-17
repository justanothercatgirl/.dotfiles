
local reloadgroup = vim.api.nvim_create_augroup("ReloadGroup", { clear = true })
require'user.remaps'

vim.api.nvim_create_autocmd (
	"BufWritePost",
	{
	group = reloadgroup,
	pattern = "*.tex",
	callback = function()
		vim.system( {'bash', 
		'-c', 
		"latexmk -shell-escape -xelatex " .. vim.fn.expand('%:t') .. " && pkill -HUP mupdf"},
		{detach = true})
	end}
)

vim.api.nvim_create_autocmd (
	{"BufRead", "BufNewFile"}, {
	pattern = {"*.tex"},
	callback = function()
		if (global_inde == nil) then
			global_inde = vim.opt.indentexpr:get()
		end
		vim.bo.autoindent = false
		vim.bo.smartindent = false
		vim.bo.cindent = false
		vim.bo.indentexpr = nil
	end,
})

-- vim.api.nvim_create_autocmd (
-- 	"InsertEnter", {
-- 		once = true,
-- 		group = reloadgroup,
-- 		pattern = "*.tex",
-- 		callback = function()
-- 			vim.system(
-- 				{'latexmk', '-xelatex', '-pvc', vim.fn.expand('%:t')}, 
-- 				{ detach = true })
-- 		end
-- 	}
-- )
