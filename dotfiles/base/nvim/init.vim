"
" ~/etc/nvim/init.vim
" NeoVim Configuration
"

" Load configuration files
source ~/.config/nvim/editor.vim
source ~/.config/nvim/keybind.vim
source ~/.config/nvim/plugin.vim

" Load current working directory overrides if present
" TODO(mrzzy): resolve .vim/init.vim from project root instead of cwd
if filereadable('.vim/init.vim')
    source .vim/init.vim
endif
