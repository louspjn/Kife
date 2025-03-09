{ config, pkgs, ... }:

{
  home.file.".config/rofi/config.rasi".source = ../dotfiles/rofi/config.rasi;
}
