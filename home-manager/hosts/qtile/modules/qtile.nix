{ config, pkgs, ... }:

{
  home.file.".config/qtile/config.py".source = ../../dotfiles/qtile/config.py;
}
