{pkgs, ...}: {
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.bc
    pkgs.zoxide
    pkgs.blightmud
    pkgs.irssi
    pkgs.weechat
    pkgs.w3m
    pkgs.nerd-fonts.jetbrains-mono
  ];

  imports = [
    ./kitty.nix
    ./git.nix
    # ./fish.nix
    ./nushell.nix
    ./tmux.nix
    ./fastfetch.nix
    ./firefox.nix
    ./reop.nix

    ../options/ulauncher.nix
  ];

  programs.home-manager.enable = true;
}
