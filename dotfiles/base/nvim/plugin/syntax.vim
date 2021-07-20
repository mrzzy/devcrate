"
" Plugin Config
" Syntax Related Configuration
" NeoVim Configuration
"

" syntax highlight
Plug 'sheerun/vim-polyglot'
" linting, warnings and errors
Plug 'neomake/neomake'
let g:neomake_highlight_columns = 0
let g:neomake_highlight_lines = 1
nnoremap <leader>mm :NeomakeToggle<cr>
