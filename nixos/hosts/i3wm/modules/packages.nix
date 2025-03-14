{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    alsa-utils
    vscode
    kdePackages.spectacle
    buildPackages.stdenv

    polybar
    nitrogen
    arandr
    xorg.libX11
  ];
}
