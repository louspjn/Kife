{ config, pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "24.11";

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
    pkgs.rofi
    pkgs.kdePackages.dolphin
    pkgs.obsidian
  ];

  imports = [
    ../default/alacritty.nix
    ../default/git.nix
    ../default/neovim.nix
    ../default/fish.nix
    ../default/tmux.nix
    ../default/rofi.nix
    ./modules/i3wm.nix
    ./modules/polybar.nix
  ];

  programs.home-manager.enable = true;
}
