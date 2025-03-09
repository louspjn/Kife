{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  pkgs.config.allowUnfree = true;

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
  ];
}
