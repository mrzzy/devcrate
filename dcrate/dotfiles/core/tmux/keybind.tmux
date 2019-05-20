#
# Tmux Configuration
# Keyboard Bindings
#

#Keyboard Bindings
# prefix
bind-key -n  M-e send-prefix
bind-key M-w send-prefix

# tabbing: pane  -> window
bind-key t break-pane
bind-key T select-window -t {last} \; join-pane -s {last}

# jumping
bind-key G choose-tree -w
bind-key g display-pane

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
bind-key C command-prompt -p "(rename-window '#W')" "rename-window '%%'"
bind-key '"' select-layout even-horizontal
bind-key "=" select-layout tiled
bind-key -r R next-layout
bind-key -r [ previous-window
bind-key -r ] next-window
bind-key -r } swap-window -t {next}
bind-key -r { swap-window -t {previous}

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

# session managment
bind-key C-W command-prompt -p "(new session)" "new-session -A -s '%%'"
bind-key "~" switch-client -n
bind-key -r } swap-window -t {next}
bind-key -r { swap-window -t {previous}

# copy Mode
bind-key c copy-mode
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

