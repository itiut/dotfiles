# prefix key
unbind-key -n C-a
set -g prefix C-z
bind-key C-z send-prefix

# split pane
bind-key | split-window -h
bind-key - split-window -v

# vi-like key bindings in copy mode
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "xclip -in -selection clipboard"

# copy to clipboard
unbind-key -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "xclip -in -selection clipboard"
