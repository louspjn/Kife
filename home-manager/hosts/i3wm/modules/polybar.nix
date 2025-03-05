{ config, pkgs, ... }:

{
  home.file.".config/polybar/config.ini".source = ../../dotfiles/polybar/config.ini;
}
