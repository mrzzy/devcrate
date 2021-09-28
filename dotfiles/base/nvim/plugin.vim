"
" Plugin Config
" NeoVim Configuration
"

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
source ~/.config/nvim_plugin/editor.vim
source ~/.config/nvim_plugin/utility.vim
source ~/.config/nvim_plugin/completion.vim
source ~/.config/nvim_plugin/syntax.vim
source ~/.config/nvim_plugin/ui.vim
call plug#end()

" plugin callback - runs after plugins are loaded
source ~/.config/nvim_plugin/callback.vim
