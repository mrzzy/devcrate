"
" Plugin Config
" User Interface/Astheics Configuration
" NeoVim Configuration
"
"UI

"colorscheme
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'

" fancy status line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

nnoremap <leader>hl :setl background=light<cr>
nnoremap <leader>hd :setl background=dark<cr>
