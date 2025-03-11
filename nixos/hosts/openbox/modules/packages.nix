{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    alsa-utils
    home-manager
    python313
    nodejs
    cargo
    rustc
    acpi
    unzip
    sqlite
    vscode
    obsidian
    kdePackages.spectacle
    buildPackages.stdenv
    gcc
    pkg-config
    fontconfig
    freetype
    expat
    xorg.libX11
  ];
}
