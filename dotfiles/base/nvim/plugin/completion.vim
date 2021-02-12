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
let g:UltiSnipsExpandTrigger = "<C-x>"
