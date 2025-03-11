{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    home-manager
    python313
    nodejs
    cargo
    rustc
    acpi
    alsa-utils
    unzip
    vscode
    kdePackages.spectacle
    buildPackages.stdenv
    gcc
    pkg-config
    fontconfig
    freetype
    expat

    polybar
    nitrogen
    arandr
    sqlite
    obsidian
    xorg.libX11
  ];
}
