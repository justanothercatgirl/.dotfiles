local term = require'toggleterm'

cxx = function()
	local script = 
	'echo $file > /dev/null;' ..
	'OLDPWD_=\\${PWD};' ..
	'while [[ ! -f CMakeLists.txt || ! -f compile_commands.json && \\\"\\$PWD\\\" != / ]]; do cd ..; done;' ..
	'if [[ -f CMakeLists.txt && -f compile_commands.json ]]; then mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j24 && ' ..
	'./\\$(sed -nr \\\"/add_executable/s/.*add_executable\\\\((\\\\S+).+/\\\\1/p\\\" ../CMakeLists.txt); fi;' ..
	'cd ${OLDPWD_}'
	vim.cmd(string.format("TermExec cmd='%s'", script))
end
-- Define the code runner configuration
require('code_runner').setup({
	mode = "toggleterm",
	focus = true,
	startinsert = true,
    	filetype = {
        	rust = 'cargo check; if [ \\$? -ne 0 ]; then echo cargo check failed; else cargo run || cargo test -- --nocapture --test-threads=1; fi; echo $file > /dev/null',
		cpp = cxx,
		c = cxx,
		python = 'python3 $file',
		tex = "mkdir -p build && if pdflatex -interaction=batchmode -output-directory=build -output-format=pdf $file; then killall -SIGHUP mupdf; else echo -e \\\\\\\\x1b[1\\\\;31mBUILD FAILED\\\\\\\\x1b[0m; fi"
	},
})
