"
" Plugin Config
" Completion Engine
" NeoVim Configuration
"

source ~/.config/nvim_plugin/completion/language.vim

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
        call coc#util#install()
        call InstallCOCExtensions()
        call DeployLangSupport(g:lang_support_config)
    endif
endfunction

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('BootstrapCOC')}

" function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" class text object
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"" keybinds
" tab completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :
        \ <SID>CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" enter completion
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()

" goto code navigation
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
" navigation between code diagnostics
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)

" show references
nmap <silent> <leader>gr <Plug>(coc-references)

" format code
nnoremap <silent> <leader>cf  <Plug>(coc-format)<cr>

" show docs
nnoremap <silent> <leader>k :call CocAction('doHover')<cr>

" coc commands
nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>
nnoremap <silent> <leader>ca :<C-u>CocAction<cr>
nnoremap <silent> <leader>cr :<C-u>CocRestart<cr>

"" autocmds
" show references on hold
autocmd CursorHold * silent call CocActionAsync('highlight')
