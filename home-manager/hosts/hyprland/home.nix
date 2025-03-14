{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/gtk.nix
  ];
}
