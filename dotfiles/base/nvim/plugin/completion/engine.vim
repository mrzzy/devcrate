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
        CocInstall -sync coc-tag coc-syntax coc-ultisnips
        
        call DeployLangSupport(g:lang_support_config)
    endif
endfunction

" completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('BootstrapCOC')}
" core sources
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'} 
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} 
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} 

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
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jt <Plug>(coc-type-definition)
nmap <silent> <leader>ji <Plug>(coc-implementation)

" usage & references
nmap <silent> <leader>jr <Plug>(coc-references) 
autocmd CursorHold * silent call CocActionAsync('highlight')

" show docs
nnoremap <silent> K :call CocAction('doHover')<cr>

" coc commands
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>ca  :<C-u>CocList actions<cr>
