{pkgs, ...}: let
  usernm = "haskex";
in {
  home = {
    username = usernm;
    homeDirectory = "/home/${usernm}";
    stateVersion = "25.05";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    zoxide
    rofi
    nitch
    hyprpaper
    hyprlock
    alsa-utils
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
  ];
}
