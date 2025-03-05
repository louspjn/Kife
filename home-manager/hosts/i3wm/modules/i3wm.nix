{ config, pkgs, ... }:

{
  home.file.".config/i3/config".source = ../../dotfiles/i3/config;
}
