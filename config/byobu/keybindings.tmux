# Default Action CTRL + b
set -g prefix ^B
set -g prefix2 F12
bind b send-prefix

# Unbind used keys
unbind-key -n C-a
unbind-key -n C-b
unbind-key -n C-d
unbind-key -n C-z

# Micro handles Shift + Arrows
unbind-key -n S-Right
unbind-key -n S-Left
unbind-key -n S-Up
unbind-key -n S-Down

# Change windows with Ctrl Left Right
bind-key -n C-Left previous-window
bind-key -n C-Right next-window

# Change panges with Ctrl Up Down
bind-key -n C-Up select-pane -U
bind-key -n C-Down select-pane -D
