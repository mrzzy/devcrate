"
" Plugin Config 
" Completion Engine
" NeoVim Configuration
" 

"Completion Engine
function! BootstrapCOC(info)
    if a:info.status == 'installed' || a:info.force
        echo 'bootstrapping coc'
        call coc#util#install({'tag':1})
        
        " basic completion sources
        echo 'setting up basic completion sources '
        call coc#add_extension('coc-tag', 'coc-syntax', 'coc-ultisnips')

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
