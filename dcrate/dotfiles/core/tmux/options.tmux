#
# Tmux Configuration
#

#tmux options
set-option -g base-index 1
set -g pane-base-index 1
set-option -g set-titles on
set-option -g status-keys vi
set-option -wg mode-keys vi
set-option -g buffer-limit 10
set-option -g set-clipboard on
set-option -g default-command $SHELL
set-option -g default-terminal screen-256color
set-option -g prefix M-w
set-option -g renumber-windows on
set-option -wg clock-mode-style 24
set-option -sg escape-time 0
set-option -g history-limit 10000
set-option -g display-panes-time 2000
set-option -g allow-rename off
set-option -g automatic-rename off
set-option -wg xterm-keys on

