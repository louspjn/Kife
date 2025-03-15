{ pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.bc
    pkgs.eza
    pkgs.zoxide
    pkgs.fastfetch
    pkgs.nerd-fonts.jetbrains-mono
  ];

  imports = [
    ../default/kitty.nix
    ../default/git.nix
    ../default/fish.nix
    ../default/tmux.nix
  ];

  programs.home-manager.enable = true;
}
