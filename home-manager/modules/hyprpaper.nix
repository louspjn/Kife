{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".source = ./dotfiles/hypr/hyprpaper.conf;
}
