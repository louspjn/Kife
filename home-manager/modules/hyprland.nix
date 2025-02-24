{ config, pkgs, ... }:

{
  home.file = {
    ".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;

    ".config/hypr/conf/autostart.conf".source = ./dotfiles/hypr/conf/autostart.conf;

    ".config/hypr/conf/binds.conf".source = ./dotfiles/hypr/conf/binds.conf;

    ".config/hypr/conf/blocks.conf".source = ./dotfiles/hypr/conf/blocks.conf;
  
    ".config/hypr/conf/cursor.conf".source = ./dotfiles/hypr/conf/cursor.conf;
  
    ".config/hypr/conf/monitors.conf".source = ./dotfiles/hypr/conf/monitors.conf;
  
    ".config/hypr/conf/rules.conf".source = ./dotfiles/hypr/conf/rules.conf;
  
    ".config/hypr/conf/variables.conf".source = ./dotfiles/hypr/conf/variables.conf;
  };
}
