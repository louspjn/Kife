{ pkgs, ... }:

{
  home.packages = [
    pkgs.rofi
    pkgs.kdePackages.dolphin
  ];

  imports = [
    ./modules/rofi.nix
    ./modules/polybar.nix
    ./modules/i3wm.nix
  ];
}
