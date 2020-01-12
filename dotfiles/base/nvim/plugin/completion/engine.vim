"
" Plugin Config 
" Completion Engine
" NeoVim Configuration
" 

"check current character is a utility
function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :
        \ <SID>CheckBackspace() ? "\<Tab>" : 
        \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" enter completion
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <C-Space> pumvisible() ? coc#refresh()  : "\<C-g>u\<CR>"
