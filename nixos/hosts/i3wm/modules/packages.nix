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
    yarn
    cargo
    rustc
    acpi
    alsa-utils
    unzip
    jdk

    polybar
    nitrogen
    arandr
  ];
}
