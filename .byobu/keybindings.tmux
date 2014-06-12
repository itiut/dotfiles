# prefix key
unbind-key -n C-a
set -g prefix C-z
bind-key C-z send-prefix

# split pane
bind-key | split-window -h
bind-key - split-window -v

# vi-like key bindings in copy mode
bind-key -t vi-copy v begin-selection
