"
" Plugin Config
" Configuration Callbacks
" NeoVim Configuration
" 

" denite keybindings
call denite#custom#option('default', 'prompt', '>')
call denite#custom#map('insert', '<C-cr>', '<denite:do_action:cd>', 'noremap')
call denite#custom#map('insert', '<cr>', '<denite:do_action:open>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert','<C-k>', '<denite:move_to_previous_line>',  'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-x>', '<denite:do_action:split>','noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
