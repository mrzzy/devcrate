"
" Plugin Config
" NeoVim Configuration
" 

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
source ~/.config/nvim/plugin/editor.vim
source ~/.config/nvim/plugin/utility.vim
source ~/.config/nvim/plugin/completion.vim
source ~/.config/nvim/plugin/syntax.vim
source ~/.config/nvim/plugin/ui.vim
call plug#end()

" plugin callback - runs after plugins are loaded
source ~/.config/nvim/plugin/callback.vim
