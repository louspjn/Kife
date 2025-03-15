{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    alsa-utils
    kdePackages.spectacle
    buildPackages.stdenv

    polybar
    nitrogen
    arandr
    xorg.libX11
  ];
}
