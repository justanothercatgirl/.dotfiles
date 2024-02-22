local term = require'toggleterm'

-- Define the code runner configuration
require('code_runner').setup({
	mode = "toggleterm",
	focus = true,
	startinsert = true,
    	filetype = {
        	rust = 'cargo check; if [ \\$? -ne 0 ]; then echo cargo check failed; else cargo run; if [ \\$? -ne 0 ]; then cargo test --test-threads=1; sleep 1; fi; fi; echo $file > /dev/null',
		cpp = function()
			local script = 
			'echo $file > /dev/null;' ..
			'while [[ ! -f CMakeLists.txt && \\\"\\$PWD\\\" != / ]]; do cd ..; done;' ..
			'if [[ -f CMakeLists.txt ]]; then mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j24 && ' ..
			'./\\$(sed -nr \\\"/add_executable/s/.*add_executable\\\\((\\\\S+).+/\\\\1/p\\\" ../CMakeLists.txt); fi;' ..
			'cd ..'
			vim.cmd(string.format("TermExec cmd='%s'", script))
		end,
	},
})
