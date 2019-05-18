"
" Plugin Config 
" Utility plugins
" NeoVim Configuration
" 

"Utility
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"
" tags & tagbar
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim' "like tagbar but newer
nnoremap <leader>tt :TagbarToggle<cr>
autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_left=1 
let g:tagbar_show_visibility=1

" undotree
Plug 'mbbill/undotree'
nnoremap <leader>uu :UndotreeToggle<cr>

" fuzzy file finding, jumping
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/unite-location'
call denite#custom#option('default', 'prompt', '>')
call denite#custom#map('insert', '<C-cr>', '<denite:do_action:cd>', '\noremap')
call denite#custom#map('insert', '<cr>', '<denite:do_action:open>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert','<C-k>', '<denite:move_to_previous_line>',  'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-x>', '<denite:do_action:split>','noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
nnoremap <c-p> :Denite file/rec<cr>
nnoremap <c-n> :Denite outline<cr>
nnoremap <c-l> :Denite location_list<cr>
nnoremap <c-k> :Denite quickfix<cr>
nnoremap <c-b> :Denite buffer<cr>
nnoremap <c-j> :Denite directory_rec<cr>

" git intergation
Plug 'tpope/vim-fugitive'
nnoremap <leader>vv :Gstatus<cr>
nnoremap <leader>vl :Glog<cr>
nnoremap <leader>ve :Gread<cr>
nnoremap <leader>vb :Gblame -MMM<cr>

" tmux integration
Plug 'tmux-plugins/tmux-resurrect'
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <M-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <M-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <M-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <M-w>l :TmuxNavigateRight<cr>
let g:tmux_navigator_no_mappings = 1

" markdown live preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
let b:IsMarkdownPreviewRunning = 0
function! MarkdownToggle()
    if b:IsMarkdownPreviewRunning == 0
        MarkdownPreview
    else 
        MarkdownPreviewStop
    end
endfunction
