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
    pkgs.fastfetch
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.fish
    pkgs.tmux
    pkgs.rofi
  ];

  imports = [
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/fish.nix
    ./modules/tmux.nix
    ./modules/i3wm.nix
    ./modules/polybar.nix
    ./modules/rofi.nix
  ];

  programs.home-manager.enable = true;
}
