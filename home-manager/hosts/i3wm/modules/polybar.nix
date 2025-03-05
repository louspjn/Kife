{ config, pkgs, ... }:

{
  home.file.".config/polybar/config".source = ../../dotfiles/polybar/config;
}
