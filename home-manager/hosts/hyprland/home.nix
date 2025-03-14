{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
    pkgs.hyprpaper
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/gtk.nix
  ];
}
