"
" Plugin Config 
" Utility plugins
" NeoVim Configuration
" 

"Utility
" tags & tagbar/symbol jumping
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim' 
nnoremap <silent> <leader>tt :Vista!!<cr>
let g:vista_default_executive = 'coc'
autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0
let g:vista_sidebar_position="vertical topleft"
let g:vista#renderer#enable_icon=0
let g:vista_update_on_text_changed=1
let g:vista_fzf_preview = ['right:50%']
nnoremap <silent> <C-j> :Vista finder fzf:coc

" undotree
Plug 'mbbill/undotree'
nnoremap <leader>uu :UndotreeToggle<cr>

"filetree browser
Plug 'lambdalisue/fern.vim'
nnoremap <silent> <leader>ff :Fern . -drawer -toggle<cr>

" fuzzy file finding, jumping
Plug 'Shougo/denite.nvim', {'do':':UpdateRemotePlugins'}
Plug 'chemzqm/unite-location'
Plug '~/.local/share/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <c-l> :Denite location_list<cr>
nnoremap <c-k> :Denite quickfix<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-g> :Ag<cr>
nnoremap <c-t> :Tags<cr>

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
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
let b:is_markdown_preview_running = 0
function! MarkdownPreviewToggle() 
    if b:is_markdown_preview_running == 0
        MarkdownPreview
        let b:is_markdown_preview_running = 1
    else 
        MarkdownPreviewStop
        let b:is_markdown_preview_running = 0
    end
endfunction
nnoremap <leader>vm :call MarkdownPreviewToggle()<cr>
