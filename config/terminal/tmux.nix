{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];

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
      set -g status-right "#{E:@catppuccin_status_application}"
      set -agF status-right "#{E:@catppuccin_status_cpu}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"
      set -agF status-right "#{E:@catppuccin_status_battery}"
    '';
  };
}
