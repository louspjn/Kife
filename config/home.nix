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
    vscode
    rofi
    nitch

    xfce.thunar
    hyprpaper
    hyprlock
    wlogout
    alsa-utils
  ];

  imports = [
    ./gph-apps/kitty.nix
    ./gph-apps/rofi.nix
    ./gph-apps/zenBrowser.nix

    ./shells/nushell/nushell.nix

    ./terminal-ultilities/fastfetch.nix
    ./terminal-ultilities/git.nix
    ./terminal-ultilities/yazi.nix
    ./terminal-ultilities/reop.nix
    ./terminal-ultilities/tmux.nix
    ./terminal-ultilities/nh.nix

    ./hyprland/hyprland.nix
    ./hyprland/waybar.nix
  ];
}
