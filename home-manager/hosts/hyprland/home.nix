{pkgs, ...}: {
  home.packages = [
    pkgs.xfce.thunar
    pkgs.hyprpaper
    pkgs.hyprlock
    pkgs.wlogout
    pkgs.alsa-utils
  ];

  imports = [
    ./modules/hyprland.nix
    ./modules/waybar.nix
    # ./modules/rofi.nix
  ];
}
