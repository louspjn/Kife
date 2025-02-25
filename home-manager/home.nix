{ config, pkgs, ... }:

{
  home.username = "tux";
  home.homeDirectory = "/home/tux";

  home.stateVersion = "24.11";

  home.sessionPath = ["~/.config/home-manager/"];
  
  home.packages = [
    pkgs.waybar
    pkgs.alacritty
    pkgs.kitty
    pkgs.zsh
    pkgs.wofi
    pkgs.chromium
    pkgs.bc
    pkgs.git
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.nitch
    pkgs.hyprpaper
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-autosuggestions
  ];

  imports = [
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/neovim.nix
    ./modules/waybar.nix
    ./modules/wofi.nix
    ./modules/zsh.nix
    ./modules/theme.nix
  ];

  home.file.".bashrc".text = "
    zsh
    exit
  ";

  programs.home-manager.enable = true;
}
