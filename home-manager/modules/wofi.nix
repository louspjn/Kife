{ config, pkgs, ... }:

{
  home.file = {
    ".config/wofi/config".source = ./dotfiles/wofi/config;

    ".config/wofi/style.css".source = ./dotfiles/wofi/style.css;
  };
}
