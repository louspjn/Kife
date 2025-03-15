{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = [
      pkgs.tmuxPlugins.nord 
    ];
  };
  home.file.".tmux.conf".text = ''
    run-shell "~/.config/system/home-manager/hosts/dotfiles/.tmux/themes/nord-tmux/nord.tmux"

    set-option -g default-command "exec fish"

    set-option -g status-position top
  '';
}
