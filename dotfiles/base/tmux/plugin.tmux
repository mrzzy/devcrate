#
# Tmux Configuration
# Plugin Config 
#

#plugin
# plugin manager
set -g @plugin 'tmux-plugins/tpm' 
# source plugin config
#source-file ~/.config/tmux/plugin/utility.tmux

#Utility
# sensible defaults
set -g @plugin 'tmux-plugins/tmux-sensible'
# clipboard integration
set -g @plugin 'tmux-plugins/tmux-yank' 
# copy pasting utility 
set -g @plugin 'Morantron/tmux-fingers' 
set -g @fingers-key f
set -g @fingers-hint-format "#[fg=yellow,bold]%s"
# directory sidebar
set -g @plugin 'tmux-plugins/tmux-sidebar' #Directory Sidebar
set -g @sidebar-tree-command 'tree -CFL 8 --noreport'
# persistence of tmux sessions.
set -g @plugin 'tmux-plugins/tmux-resurrect' 
set -g @resurrect-strategy-nvim 'session'
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-processes ':all:'
# automatic persistence of tmux sessions
set -g @plugin 'tmux-plugins/tmux-continuum' 
set -g @continuum-restore 'on'
set -g @continuum-save-interval '10'
# vim-tmux keybinding integration
check_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key h if-shell "$check_vim" "send-prefix; send-keys h" "select-pane -L"
bind-key j if-shell "$check_vim" "send-prefix; send-keys j" "select-pane -D"
bind-key l if-shell "$check_vim" "send-prefix; send-keys l" "select-pane -R"
bind-key k if-shell "$check_vim" "send-prefix; send-keys k" "select-pane -U"
#source-file ~/.config/tmux/plugin/ui.tmux

#user interface
# battery indicator
set -g @plugin 'tmux-plugins/tmux-battery' 
set -g @batt_remain_short true
set -g @batt_remain_short true
BATTERY_STATUS="#{battery_graph}#{battery_percentage}"
# cpu, memory info status bar
set -g status-interval 3
set -g @plugin 'thewtex/tmux-mem-cpu-load' 
SYSTEM_STATUS="#(~/.tmux/plugins/tmux-mem-cpu-load/tmux-mem-cpu-load --powerline-right --interval 2 --graph-lines 5 --mem-mode 2 --averages-count 1)"
# status bar styling 
set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#a89984,bg=#504945"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#a89984"
set -g status-style "none,bg=#3c3836"
set -g message-style "fg=#a89984,bg=#504945"
set -g pane-border-style "fg=#504945"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#a89984,bg=#3c3836"
set -g status-left "#[fg=#282828,bg=#a89984] #S #[fg=#a89984,bg=#3c3836,nobold,nounderscore,noitalics]"
set -g status-right "$SYSTEM_STATUS #[fg=#504945,bg=#3c3836,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] %Y-%m-%d  %H:%M~#{battery_remain} #[fg=#a89984,bg=#504945,nobold,nounderscore,noitalics]#[fg=#282828,bg=#a89984] #h $BATTERY_STATUS "
setw -g window-status-format "#[fg=#a89984,bg=#3c3836] #I #[fg=#a89984,bg=#3c3836] #W "
setw -g window-status-current-format "#[fg=#3c3836,bg=#504945,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] #I #[fg=#a89984,bg=#504945] #W #[fg=#504945,bg=#3c3836,nobold,nounderscore,noitalics]"

# plugin manager callback
set-environment -g TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/"
run -b "~/.tmux/plugins/tpm/tpm"
