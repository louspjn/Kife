{ config, pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "24.11";

  home.sessionPath = ["~/.config/system/home-manager/"];
  
  home.packages = [
    pkgs.alacritty
    pkgs.chromium
    pkgs.bc
    pkgs.git
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.nitch
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.fish
    pkgs.tmux
  ];

  imports = [
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/fish.nix
    ./modules/tmux.nix
  ];

  programs.home-manager.enable = true;
}
