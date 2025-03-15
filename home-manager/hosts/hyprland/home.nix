{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
    pkgs.hyprpaper
    pkgs.wofi
    pkgs.hyprlock
    pkgs.wlogout
    pkgs.hyprpanel
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/waybar.nix
    ./modules/hyprlock.nix
  ];
}
