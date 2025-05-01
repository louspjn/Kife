{pkgs, ...}: {
  home.username = "haskex";
  home.homeDirectory = "/home/haskex";

  home.stateVersion = "25.05";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    bc
    zoxide
    blightmud
    irssi
    weechat
    w3m
    nerd-fonts.jetbrains-mono
    rofi
    nitch

    hyprpaper
    hyprlock
    alsa-utils
  ];

  imports = [
    ./programs/kitty.nix
    # ./programs/ghostty.nix
    ./programs/rofi.nix
    ./programs/zenBrowser.nix

    ./shells/nushell/nushell.nix

    ./terminal/fastfetch.nix
    ./terminal/git.nix
    ./terminal/yazi.nix
    ./terminal/reop.nix
    ./terminal/tmux.nix
    ./terminal/nh.nix
    ./terminal/neovim.nix

    ./hyprland/hyprland.nix
  ];
}
