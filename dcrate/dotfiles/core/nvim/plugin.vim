"
" Plugin Config
" NeoVim Configuration
" 

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

source ~/.config/nvim/plugin/editor.vim
source ~/.config/nvim/plugin/utility.vim

"lang: latex
Plug 'lervag/vimtex'

" errors
Plug 'neomake/neomake'

"Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

Plug 'landaire/deoplete-swift'
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'Shougo/neco-syntax'
Plug 'vim-scripts/vim-javacomplete2'
Plug 'c9s/perlomni.vim'
Plug 'zchee/deoplete-asm'
Plug 'OmniSharp/omnisharp-vim'

"Syntax
Plug 'sirtaj/vim-openscad'
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'

"Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"Plugin Configuration
"Plugin Display configuration

" Usage: Display_Reload(('dark'|'light']))
function! DisplayReload(mode)
    if a:mode == 'dark'
        highlight SpellBad ctermfg=White ctermbg=Red
        highlight SpellCap ctermfg=White ctermbg=Yellow
    elseif a:mode == 'light'
        highlight SpellBad ctermfg=White ctermbg=DarkRed
        highlight SpellCap ctermfg=White ctermbg=DarkYellow
    endif
endfunction
call DisplayReload('dark')
"Deoplete
let g:deoplete#enable_at_startup=1

call deoplete#custom#option({
\ 'auto_complete_delay': 120,
\ 'auto_refresh_delay': 100,
\ 'smart_case': v:true,
\ })

if has('win64')
    let g:python3_host_prog='C:\Python37\python.exe'
else
    let g:python_host_prog  = '/usr/bin/python'
    let g:python3_host_prog  = '/usr/bin/python3'
endif

"Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-n>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1

"Clang Complete
let g:clang_library_path='/usr/local/opt/llvm/lib/libclang.dylib'
"TODO: Make this portable to linux
"let g:deoplete#sources#clang#libclang_path=
            "\"/usr/local/opt/llvm/lib/libclang.dylib"

"Neomake
call neomake#configure#automake('w')
let g:neomake_highlight_columns = 0
let g:neomake_highlight_lines = 1
let g:neomake_python_python_exe = 'python3'

"Ultisnips
let g:UltiSnipsExpandTrigger = "<C-x>"

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1


" Vim Go
let g:go_fmt_command="goimports"
let g:go_metalinter_autosave=1
let g:go_gocode_unimported_packages=1

"Plugin Bindings 
" Appearance
nnoremap <leader>hl :setl background=light\|call Display_Reload('light')<cr>
nnoremap <leader>hd :setl background=dark\|call Display_Reload('dark')<cr>
" Deoplete
nnoremap <leader>cc :call deoplete#toggle()<cr>

" Neomake
nnoremap <leader>mm :NeomakeToggle<cr>
