{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  pkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    home-manager
    python313
    nodejs
    rustc
    cargo
    unzip
    sqlite
    vscode
  ];
}
