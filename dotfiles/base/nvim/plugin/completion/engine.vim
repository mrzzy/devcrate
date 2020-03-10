"
" Plugin Config 
" Completion Engine
" NeoVim Configuration
" 

"" editing
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
        call coc#add_extension('coc-tag', 'coc-syntax', 'coc-snippets')

        call DeployLangSupport(g:lang_support_config)
    endif
endfunction

" completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('BootstrapCOC')}

" function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

"" keybinds
" tab completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :
        \ <SID>CheckBackspace() ? "\<Tab>" : 
        \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" enter completion
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <C-Space> pumvisible() ? coc#refresh()  : "\<C-g>u\<CR>"

" goto code navigation
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)

" usage & references
nmap <silent> <leader>gr <Plug>(coc-references) 
autocmd CursorHold * silent call CocActionAsync('highlight')

" show docs
nnoremap <silent> K :call CocAction('doHover')<cr>

" coc commands
nnoremap <silent> <space>cd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <space>ca  :<C-u>CocList actions<cr>
nnoremap <silent> <C-j> :<C-u>CocList outline<cr>
