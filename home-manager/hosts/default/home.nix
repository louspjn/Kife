{ pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.bc
    pkgs.eza
    pkgs.zoxide
    pkgs.nerd-fonts.jetbrains-mono
  ];

  imports = [
    ./kitty.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./fastfetch.nix
    ./firefox.nix
    ./lf.nix

    ../options/ulauncher.nix
  ];

  programs.home-manager.enable = true;
}
