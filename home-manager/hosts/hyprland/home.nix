{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/gtk.nix
  ];
}
