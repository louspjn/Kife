{ pkgs, ... }:

{
  home.packages = [
    pkgs.xfce.thunar
    pkgs.hyprpaper
    pkgs.wofi
    pkgs.hyprlock
    pkgs.wlogout
    pkgs.alsa-utils
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/hyprlock.nix
    # ./modules/wlogout.nix
  ];
}
