{pkgs, ...}: let
  usernm = "haskex";
in {
  home = {
    username = usernm;
    homeDirectory = "/home/${usernm}";
    stateVersion = "25.05";
  };

  home.packages = with pkgs; [
    zoxide
    rofi
    hyprpaper
    hyprlock
    alsa-utils
    nitch

    nautilus
    loupe
  ];

  imports = [
    ./programs/kitty.nix
    ./programs/rofi.nix
    ./programs/zenBrowser.nix

    ./shells/nushell/nushell.nix

    ./terminal/git.nix
    ./terminal/yazi.nix
    ./terminal/reop.nix
    ./terminal/tmux.nix
    ./terminal/nh.nix
    ./terminal/neovim.nix

    ./hyprland/hyprland.nix

    ./ui/stylix.nix
    ./nix/nixpkgs.nix
  ];
}
