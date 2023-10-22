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
call plug#end()

set nobackup
set nowritebackup
set updatetime=420

cmap w!! w !sudo tee % > /dev/null

nnoremap <C-f> :NERDTreeFocus<CR>
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#confirm()
    \: "<C-g>u<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

:colo evening

