"
" Plugin Config 
" Completion Engine
" NeoVim Configuration
" 

"Completion Engine
" language support
source ~/.config/nvim/plugin/completion/language.vim
 
function! BootstrapCOC(info)
    if a:info.status == 'installed' || a:info.force
        echo 'bootstrapping coc'
        call coc#util#install({'tag':1})
        
        " completion sources
        echo 'setting up completion sources '
        CocInstall -sync 'coc-tag'
        CocInstall -sync 'coc-syntax'
        CocInstall -sync 'coc-ultisnips'

        call DeployLangSupport(g:lang_support_config)
    endif
endfunction

" completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('BootstrapCOC')}

" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" enter completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
