"
" ~/etc/nvim/init.vim
" NeoVim Configuration
"

" Load configuration files
source ~/.config/nvim/editor.vim
source ~/.config/nvim/keybind.vim
source ~/.config/nvim/plugin.vim

" Load current working directory overrides if present
if filereadable(".init.vim")
    source .init.vim
endif
