"
" Plugin Config
" Utility plugins
" NeoVim Configuration
"

"Utility
" tag jumping
Plug 'ludovicchabant/vim-gutentags'
nnoremap <silent> <c-t> :Tags<cr>

" symbol jumping
Plug 'liuchengxu/vista.vim'
nnoremap <silent> <leader>tt :Vista!!<cr>
let g:vista_default_executive = 'coc'
autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0
let g:vista_sidebar_position="vertical topleft"
let g:vista#renderer#enable_icon=0
let g:vista_update_on_text_changed=1
let g:vista_fzf_preview = ['right:50%']
nnoremap <silent> <C-j> :Vista finder fzf:coc<cr>

" undotree
Plug 'mbbill/undotree'
nnoremap <leader>uu :UndotreeToggle<cr>

" filetree browser/file explorer
Plug 'lambdalisue/fern.vim'
let g:fern#disable_default_mappings = 1
nnoremap <silent> <leader>ff :Fern . -drawer -toggle<cr>
" focus fern window
nnoremap <silent> <leader>gf :FernDo :<cr>
autocmd FileType fern nmap <buffer> <C-w>" <Plug>(fern-action-zoom:half)
autocmd FileType fern nmap <buffer> .. <Plug>(fern-action-hidden:toggle)
autocmd FileType fern nmap <buffer> / <Plug>(fern-action-include)
autocmd FileType fern nmap <buffer> m <Plug>(fern-action-mark:set)
autocmd FileType fern nmap <buffer> M <Plug>(fern-action-mark:unset)
autocmd FileType fern nmap <buffer> <C-l> <Plug>(fern-action-reload:all)
autocmd FileType fern nmap <buffer> l <Plug>(fern-action-expand:in)
autocmd FileType fern nmap <buffer> h <Plug>(fern-action-collapse)
autocmd FileType fern nmap <buffer> <C-i> <Plug>(fern-action-enter)
autocmd FileType fern nmap <buffer> <C-]> <Plug>(fern-action-enter)
autocmd FileType fern nmap <buffer> <C-o> <Plug>(fern-action-leave)
autocmd FileType fern nmap <buffer> <cr> <Plug>(fern-action-open-or-expand)
autocmd FileType fern nmap <buffer> v<cr> <Plug>(fern-action-open:vsplit)
autocmd FileType fern nmap <buffer> s<cr> <Plug>(fern-action-open:split)
autocmd FileType fern nmap <buffer> t<cr> <Plug>(fern-action-open:tabedit)
autocmd FileType fern nmap <buffer> yy <Plug>(fern-action-clipboard-copy)
autocmd FileType fern nmap <buffer> dd <Plug>(fern-action-clipboard-move)
autocmd FileType fern nmap <buffer> p <Plug>(fern-action-clipboard-paste)
autocmd FileType fern nmap <buffer> DD <Plug>(fern-action-remove)
autocmd FileType fern nmap <buffer> cd <Plug>(fern-action-cd:cursor)
autocmd FileType fern nmap <buffer> cw <Plug>(fern-action-rename)
autocmd FileType fern nmap <buffer> e <Plug>(fern-action-new-path)

" fuzzy file finding, jumping
Plug '~/.local/share/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<cr>
nnoremap <c-g> :Ag<cr>

" git integration
Plug 'tpope/vim-fugitive'
nnoremap <leader>vv :Gstatus<cr>
nnoremap <leader>vl :Glog<cr>
nnoremap <leader>ve :Gread<cr>
nnoremap <leader>vb :Gblame -MMM<cr>

" debugger (c/c++/python/bash) integration
Plug 'sakhnik/nvim-gdb', {'do': ':UpdateRemotePlugins'}
let g:nvimgdb_disable_start_keymaps = 1
nnoremap <leader>dd :GdbStart gdb<cr>
nnoremap <leader>DD :GdbStartLLDB lldb<cr>
let g:nvimgdb_config_override = {
            \ 'key_until':      '<leader>du',
            \ 'key_continue':   '<leader>dc',
            \ 'key_next':       ']d',
            \ 'key_step':       ']D',
            \ 'key_finish':     '[d',
            \ 'key_breakpoint': '<leader>db',
            \ 'key_frameup':    '<leader>dk',
            \ 'key_framedown':  '<leader>dj',
            \ 'key_eval':       '=d',
            \ 'key_quit':       '<leader>dq',
            \ 'codewin_command': 'vnew'
            \ }

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
let g:mkdp_auto_close = 0
nnoremap <leader>vm :MarkdownPreview<cr>
