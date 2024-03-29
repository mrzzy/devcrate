"
" ~/etc/nvim/init.vim
" NeoVim Configuration
"

"Keyboard Bindings
let g:mapleader = ","

" visual mode select-search
vnoremap * "*y/\V<c-r>*<cr><esc>
vnoremap # "*y?\V<c-r>*<cr><esc>
" repeat last substitution
nnoremap & :&&<cr>
vnoremap & :&&<cr>
" spell checking
nnoremap <leader>S :setl spell!<cr>
nnoremap <leader>ss z=
" pasting
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" project search
nnoremap <leader>/ :grep 
" tags navigation
nnoremap <C-]> <C-]><cr>
nnoremap <C-T> <C-T><cr>
nnoremap <leader>K :execute 'ptag ' . expand('<cword>')<cr>
" tab navigation/arrangement
nnoremap <C-w>[ :tabprevious<cr>
nnoremap <C-w>] :tabnext<cr>
nnoremap <C-w>{ :tabmove -1<cr>
nnoremap <C-w>} :tabmove +1<cr>

" Marker columns
nnoremap <leader>\ :set colorcolumn=80<cr> :set cursorline<cr>
nnoremap <leader>\| :set colorcolumn=0<cr> :set nocursorline<cr>
" unclutter workspace
function! BindingUnclutter()
    pclose
    cclose
endfunction
nnoremap <silent> <Esc><Esc> :noh\|call BindingUnclutter()<cr>

" view arg, location and quickfix lists
nnoremap <c-l> :lopen<cr>
nnoremap <c-k> :copen<cr>
" reset arg list
nnoremap <leader>a :args 
