#
# Tmux Configuration
# Keyboard Bindings
#

#Keyboard Bindings
# send prefix key to process, useful for nested tmux sessions
# tmux prefix is set using 'prefix" option
bind-key M-w send-prefix
bind-key -n M-e send-prefix

# tabbing: pane  -> window
bind-key t break-pane
bind-key T select-window -t {last} \; join-pane -s {last}

# jumping & searching windows
bind-key G choose-tree -w
bind-key g display-pane
bind-key / command-prompt -p "(search)" "search-window '%%'"

# window jumping
bind-key "0" select-window -t :10
bind-key '^' select-window -t {start}
bind-key '$' select-window -t {end}
bind-key -n M-1 select-window -t 1
bind-key -n M-2 select-window -t 2
bind-key -n M-3 select-window -t 3
bind-key -n M-4 select-window -t 4
bind-key -n M-5 select-window -t 5
bind-key -n M-6 select-window -t 6
bind-key -n M-7 select-window -t 7
bind-key -n M-8 select-window -t 8
bind-key -n M-9 select-window -t 9
bind-key -n M-0 select-window -t 10
bind-key "`" last-pane

# manage windows
bind-key w new-window -a -c "#{pane_current_path}"
# alt binding for termux Android
bind-key e new-window -a -c "#{pane_current_path}"
bind-key C command-prompt -p "(rename)" "rename-window '%%'"
bind-key '"' select-layout even-horizontal
bind-key "=" select-layout Tiled
bind-key -r "*" next-layout
bind-key -r [ previous-window
bind-key -r ] next-window
bind-key -r "}" swap-window -t +1
bind-key -r "{" swap-window -t -1

# manage panes
bind-key -r C-L resize-pane -R 5
bind-key -r C-J resize-pane -D 5
bind-key -r C-H resize-pane -L 5
bind-key -r C-K resize-pane -U 5
bind-key s split-window -v -c "#{pane_current_path}"
bind-key v split-window -h -c "#{pane_current_path}"
bind-key H swap-pane -t {left-of}\; select-pane -t {left-of}
bind-key J swap-pane -t {down-of}\; select-pane  -t {down-of}
bind-key K swap-pane -t {up-of}\; select-pane  -t {up-of}
bind-key L swap-pane -t {right-of}\; select-pane -t {right-of}
bind-key x swap-pane -t {last}
bind-key z resize-pane -Z

# session management
bind-key C-W command-prompt -p "(new session)" "new-session -A -s '%%'"
bind-key "~" switch-client -n

# copy mode
bind-key c copy-mode
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -sel clipboard'
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
