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

    polybar
    nitrogen
    arandr
    sqlite
    obsidian
  ];
}
