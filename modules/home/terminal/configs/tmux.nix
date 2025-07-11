{
  prefix = "C-s";
  keyMode = "vi";

  extraConfig = ''
    # Pane keybindings
    bind | split-window -h
    bind - split-window -v

    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    bind c new-window
    bind w choose-window

    # Status bar
    set -g status-position top
    set -g status-right-length 100
    set -g status-left-length 100
    set -g status-left ""
    set -g @tmux-gruvbox 'dark'
  '';
}
