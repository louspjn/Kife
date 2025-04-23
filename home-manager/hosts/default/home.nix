{pkgs, ...}: {
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "25.05";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = [
    pkgs.bc
    pkgs.zoxide
    pkgs.blightmud
    pkgs.irssi
    pkgs.weechat
    pkgs.w3m
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.vscode
    pkgs.rofi
  ];

  imports = [
    ./gph-apps/firefox.nix
    ./gph-apps/kitty.nix
    ./gph-apps/rofi.nix

    ./shells/nushell/nushell.nix

    ./terminal-ultilities/fastfetch.nix
    ./terminal-ultilities/git.nix
    ./terminal-ultilities/yazi.nix
    ./terminal-ultilities/reop.nix
    ./terminal-ultilities/tmux.nix
    ./terminal-ultilities/nh.nix
  ];
}
