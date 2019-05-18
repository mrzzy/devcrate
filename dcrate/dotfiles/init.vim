
"
" ~/etc/nvim/init.vim
" NeoVim Configuration
" 

"Editor Settings
set autoindent
set autoread
set completeopt=longest,menu,preview
set expandtab
set hidden
set ignorecase
set laststatus=2
set magic
set noshowmode
set number
set ruler
set shiftwidth=4
set shortmess+=c
set showtabline=2
set smartcase
set smartindent
set smarttab
set tabstop=4
set wildmenu
set wildmode=longest,list,full
set lazyredraw
set splitbelow
set history=1000

"Display Settings
set hlsearch
set background=dark
colorscheme desert

"Keyboard Bindings
let g:mapleader = ","
vnoremap * "*y/\V<c-r>*<cr><esc>
vnoremap # "*y?\V<c-r>*<cr><esc>
nnoremap & :&&<cr>
vnoremap & :&&<cr>

nnoremap <leader>q :qa<cr>
nnoremap <leader>S :setl spell!<cr>
nnoremap <leader>ss z=
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>g :grep
nnoremap <leader>t :tags<cr>
nnoremap <C-]> <C-]><cr>
nnoremap <C-T> <C-T><cr>
nnoremap <leader>k :execute 'ptag ' . expand('<cword>')<cr>

nnoremap <leader>] :next\|args<cr>
nnoremap <leader>[ :Next\|args<cr>
nnoremap <leader>a :args<cr>
nnoremap <leader>A :argadd 
nnoremap <leader>aa :argadd\|args<cr>
nnoremap <leader>ad :argdelete %\|args<cr>
nnoremap <leader>a0 :argrewind\|args<cr>
nnoremap <leader>a$ :arglast %\|args<cr>

nnoremap <leader>ww :tabnew<cr>
nnoremap <leader>wq :tabclose<cr>
nnoremap <leader>w] :tabnext<cr>
nnoremap <leader>w[ :tabNext<cr>
nnoremap <leader>w0 :tabrewind<cr>
nnoremap <leader>w$ :tablast<cr>
nnoremap <leader>w{ :tabmove -1<cr>
nnoremap <leader>w} :tabmove +1<cr>

nnoremap <leader>\ :set colorcolumn=80<cr> :set cursorline<cr>
nnoremap <leader>\| :set colorcolumn=0<cr> :set nocursorline<cr>

function! Binding_Unclutter()
    pclose 
    cclose
    helpclose
endfunction
nnoremap <silent> <Esc><Esc> :noh\|call Binding_Unclutter()<cr>

"Search Settings 
set grepprg=ag\ --vimgrep\ --nocolor\ --nogroup\ '$*'
set grepformat=%f:%l:%c:%m

"File Settings
set encoding=utf8
" set path+=/usr/local/include/,/usr/local/include/c++/7.1.0/,/usr/include/
filetype plugin on
filetype plugin indent on

autocmd Filetype scheme setlocal tabstop=2
autocmd Filetype make setlocal noexpandtab
autocmd FileType crontab setlocal backupcopy=yes
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType ruby setlocal tabstop=2|setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.sc setf scala
autocmd BufNewFile,BufRead *.etc setf m4

"Plugin
call plug#begin('~/.local/share/nvim/plugged')

"Editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'coderifous/textobj-word-column.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'

"Utility
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/unite-location'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'tpope/vim-obsession'
Plug 'tmux-plugins/tmux-resurrect'
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-window-resize-easy'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-projectionist'
Plug 'majutsushi/tagbar'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

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
colorscheme solarized

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

"Denite
call denite#custom#option('default', 'prompt', '>')

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('file_rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#map('normal', '<Esc>', '<denite:quit>',
      \'noremap')
call denite#custom#map('normal', 'j', '<denite:move_to_next_line>',
      \'noremap')
call denite#custom#map('normal', 'k', '<denite:move_to_previous_line>',
      \'noremap')
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:do_action:cd>',
      \'noremap')
call denite#custom#map('insert', '<cr>', '<denite:do_action:open>',
      \'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>',
        \'noremap')
call denite#custom#map('insert','<C-k>', '<denite:move_to_previous_line>',
      \ 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('insert', '<C-x>', '<denite:do_action:split>',
      \'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:do_action:preview>',
      \'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>',
      \'noremap')

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

"Incsearch
let g:incsearch#magic = '\v'

"Tmux-Vim Navigator
let g:tmux_navigator_no_mappings = 1

" Vim Go
let g:go_fmt_command="goimports"
let g:go_metalinter_autosave=1
let g:go_gocode_unimported_packages=1

" TagBar
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_left=1 
let g:tagbar_show_visibility=1

"Plugin Bindings 
" Appearance
nnoremap <leader>hl :setl background=light\|call Display_Reload('light')<cr>
nnoremap <leader>hd :setl background=dark\|call Display_Reload('dark')<cr>

" Denite
nnoremap <c-p> :Denite file_rec<cr>
nnoremap <c-n> :Denite outline<cr>
nnoremap <c-l> :Denite location_list<cr>
nnoremap <c-k> :Denite quickfix<cr>
nnoremap <c-b> :Denite buffer<cr>
nnoremap <c-j> :Denite directory_rec<cr>
nnoremap <c-g> :Denite grep<cr>

call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', '.'])
call denite#custom#var("grep", 'command',
    \ ['ag', '--vimgrep', '--follow', '--nocolor', '--nogroup'])

" Deoplete
nnoremap <leader>cc :call deoplete#toggle()<cr>

" Neomake
nnoremap <leader>mm :NeomakeToggle<cr>

" Search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Tmux integration
nnoremap <silent> <M-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <M-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <M-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <M-w>l :TmuxNavigateRight<cr>

" Version Control
nnoremap <leader>vv :Gstatus<cr>
nnoremap <leader>vl :Glog<cr>
nnoremap <leader>ve :Gread<cr>
nnoremap <leader>vb :Gblame -MMM<cr>

" Undotree
nnoremap <leader>uu :UndotreeToggle<cr>

" TagBar
nnoremap <leader>tt :TagbarToggle<cr>

" Markdown Preview 
" MarkdownToggle() Toggle markdown preview on off
let b:IsMarkdownPreviewRunning = 0
function! MarkdownToggle()
    if b:IsMarkdownPreviewRunning == 0
        MarkdownPreview
    else 
        MarkdownPreviewStop
    end
endfunction

nnoremap <leader>mm :call MarkdownToggle()<cr>

" Vim sessions
nnoremap <leader>ws :Obession Session.vim<cr>

"Plugin Autocommands
autocmd InsertEnter * call deoplete#enable()
autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0
