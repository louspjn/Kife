{ config, pkgs, ... }:

{
  home.file = {
    ".config/waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;

    ".config/waybar/style.css".source = ./dotfiles/waybar/style.css;
  };
}
