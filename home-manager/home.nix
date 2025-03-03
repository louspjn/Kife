{ config, pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "24.11";

  home.sessionPath = ["~/.config/home-manager/"];
  
  home.packages = [
    pkgs.alacritty
    pkgs.vivaldi
    pkgs.bc
    pkgs.git
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.nitch
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.fish
  ];

  imports = [
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/fish.nix
  ];

  home.file.".bashrc".text = "
    zsh
    exit
  ";

  programs.home-manager.enable = true;
}
