{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = [
      pkgs.tmuxPlugins.nord 
    ];
  };
}
