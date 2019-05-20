"
" Plugin Config
" NeoVim Configuration
" 

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

source ~/.config/nvim/plugin/editor.vim
source ~/.config/nvim/plugin/utility.vim
source ~/.config/nvim/plugin/engine.vim

"lang: latex
Plug 'lervag/vimtex'

" errors
Plug 'neomake/neomake'

"Syntax
Plug 'sirtaj/vim-openscad'
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'

"Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

source ~/.config/nvim/plugin/callback.vim

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

"Neomake
call neomake#configure#automake('w')
let g:neomake_highlight_columns = 0
let g:neomake_highlight_lines = 1

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

"Plugin Bindings 
" Appearance
nnoremap <leader>hl :setl background=light\|call Display_Reload('light')<cr>
nnoremap <leader>hd :setl background=dark\|call Display_Reload('dark')<cr>
" Deoplete
nnoremap <leader>cc :call deoplete#toggle()<cr>

" Neomake
nnoremap <leader>mm :NeomakeToggle<cr>
