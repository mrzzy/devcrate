"
" Plugin Config 
" Auto Completion
" NeoVim Configuration
"

"Completion 
" language support
source ~/.config/nvim/plugin/completion/language.vim
" completion engine
source ~/.config/nvim/plugin/completion/engine.vim

" filepath completion   
Plug 'Shougo/neoinclude.vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = "<C-x>"
