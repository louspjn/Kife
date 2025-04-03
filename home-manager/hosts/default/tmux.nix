{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    plugins = [
      pkgs.tmuxPlugins.nord 
    ];
  };
}
