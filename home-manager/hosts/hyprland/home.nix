{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
    pkgs.hyprpaper
    pkgs.wofi
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/waybar.nix
  ];
}
