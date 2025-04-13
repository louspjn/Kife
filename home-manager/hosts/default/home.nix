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
    ./gph-apps/firefox.nix
    ./gph-apps/kitty.nix

    ./shells/nushell/nushell.nix
    # ./shells/fish/fish.nix

    ./terminal-ultilities/fastfetch.nix
    ./terminal-ultilities/git.nix
    # ./terminal-ultilities/helix.nix
    ./terminal-ultilities/lf.nix
    ./terminal-ultilities/reop.nix
    ./terminal-ultilities/tmux.nix
    ./terminal-ultilities/nh.nix

    ../options/ulauncher.nix
  ];
}
