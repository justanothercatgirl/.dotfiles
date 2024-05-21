local dap = require('dap')

-- try getting arguments
-- function()
-- 		local string = vim.ui.input("arguments to program:")
-- 		local t = {}
-- 		for str in string.gmatch(string, "([^ ]+)") do
-- 			table.insert(str)
-- 		end
-- 		return t
-- 	end,


lldb = {
	name = "LLDB",
	type = "lldb",
	request = "launch",
	program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false
}

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb"
}

dap.configurations = {
	cpp = { lldb },
	rust = { lldb },
}
