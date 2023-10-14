:set number
:set autoindent
:set tabstop=8
:set shiftwidth=4 "this sets tabulation width!
:set smarttab
:set nowrap

let g:python3_host_prog = '~/.config/nvim/python3/bin/python'
" let g:python_host_prog  = '/usr/bin/python'

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'	" status bar
Plug 'https://github.com/preservim/nerdtree'		" file manager
Plug 'https://github.com/tpope/vim-surround'		" cs\"' (cnahge surroundings)
Plug 'https://github.com/tpope/vim-commentary'		" comment and uncomment
Plug 'https://github.com/rafi/awesome-vim-colorschemes'	" themes, basically
Plug 'https://github.com/ryanoasis/vim-devicons'	" icons for some plugins?????
Plug 'https://github.com/terryma/vim-multiple-cursors'	" this is gonna be tough to learn...
" Plug 'ycm-core/YouCompleteMe'	" autocompletion (REQUIRES PYTHON3 VENV)
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Language-server

cmap w!! w !sudo tee % > /dev/null

nnoremap <C-f> :NERDTreeFocus<CR>


call plug#end()

:colo evening

