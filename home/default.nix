{pkgs, ...}: let
  usernm = "haskex";
in {
  home = {
    username = usernm;
    homeDirectory = "/home/${usernm}";
    stateVersion = "25.05";
  };

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [(import ../pkgs/pkgs.nix)];
  };

  home.packages = with pkgs; [
    zoxide
    alsa-utils
    nitch
    nautilus
    loupe
  ];

  imports = [
    ./programs
    ./terminal
    ./hyprland
    ./ui
  ];
}
