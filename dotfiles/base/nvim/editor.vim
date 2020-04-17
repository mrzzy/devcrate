"
" Basic Editor Config
" NeoVim Configuration
" 
"editor Settings
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
set splitbelow
set splitright
set history=1000

" file Settings
set encoding=utf8
" set path+=/usr/local/include/,/usr/local/include/c++/7.1.0/,/usr/include/
filetype plugin on
filetype plugin indent on
" filetype specific config
autocmd Filetype scheme setlocal tabstop=2
autocmd Filetype make setlocal noexpandtab
autocmd Filetype go setlocal noexpandtab
autocmd Filetype gdscript3 setlocal noexpandtab
autocmd FileType crontab setlocal backupcopy=yes
autocmd FileType java setlocal tabstop=2|setlocal shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2|setlocal shiftwidth=2
autocmd Filetype javascriptreact setlocal tabstop=2|setlocal shiftwidth=2
autocmd Filetype json setlocal tabstop=2|setlocal shiftwidth=2
autocmd FileType ruby setlocal tabstop=2|setlocal shiftwidth=2
autocmd FileType html setlocal tabstop=2|setlocal shiftwidth=2
autocmd FileType proto setlocal tabstop=4|setlocal shiftwidth=4
" automatic filetye detection
autocmd BufNewFile,BufRead *.sc setf scala
autocmd BufNewFile,BufRead *.etc setf m4
autocmd BufNewFile,BufRead *.tmux setf tmux
autocmd BufNewFile,BufRead *.cshtml setf html

" search settings 
" use ag for search if present
if executable('ag')
    set grepprg=ag\ --vimgrep\ --nocolor\ --nogroup\ '$*'
endif
set grepformat=%f:%l:%c:%m

" ui settings - (basic see plugin ui.vim for full config)
set hlsearch
set termguicolors
set background=dark
colorscheme desert
