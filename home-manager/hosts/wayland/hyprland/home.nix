{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
    pkgs.hyprpaper
    pkgs.hyprlock
    pkgs.wlogout
    pkgs.alsa-utils
  ];

  imports = [
    ./modules/hyprland.nix
    ../default/waybar.nix
    ../default/ulauncher.nix
  ];
}
