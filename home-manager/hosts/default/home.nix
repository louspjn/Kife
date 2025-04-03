{ pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.bc
    pkgs.eza
    pkgs.zoxide
    pkgs.blightmud
    pkgs.irssi
    pkgs.weechat
    pkgs.w3m
    pkgs.nerd-fonts.jetbrains-mono
  ];

  nixpkgs.overlays = [ (import ../../../sourcecodes/Reop/overlay.nix) ];

  imports = [
    ./kitty.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./fastfetch.nix
    ./firefox.nix
    ./lf.nix
    ./reop.nix

    ../options/reop.nix
    ../options/ulauncher.nix
  ];

  programs.home-manager.enable = true;
}
