"
" Plugin Config
" Auto Completion
" NeoVim Configuration
"

"Completion
" completion engine
source ~/.config/nvim/plugin/completion/engine.vim
" language support
source ~/.config/nvim/plugin/completion/language.vim

" filepath completion
Plug 'Shougo/neoinclude.vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" do not bind expansion trigger
let g:UltiSnipsExpandTrigger = '<M-x>'
" navigiate between fields of snippet
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
