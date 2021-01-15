"
" Plugin Config 
" Editor plugins
" NeoVim Configuration
" 


"Editor
" text editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
" text objects
Plug 'coderifous/textobj-word-column.vim'
Plug 'wellle/targets.vim'
" bindings
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
" search
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
let g:incsearch#magic = '\v'
" auto-sessions
Plug 'vphantom/vim-obsession'
nnoremap <leader>ws :Obsession Session.vim<cr>
" resize panes
Plug 'simeji/winresizer'
let g:winreizer_vert_resize=5
let g:winreizer_horiz_resize=5
let g:winresizer_start_key="<C-w>r"
" auto alignment
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" fix/Patches to editor
" fixes: https://github.com/neovim/neovim/issues/12587
" Fix CursorHold performance issue
Plug 'antoinemadec/FixCursorHold.nvim'
