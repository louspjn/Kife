{ pkgs, ... }:

let
  flake = "~/setup";
in
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
     set fish_greeting

     # fastfetch
     zoxide init fish | source

     set -x NIXPKGS_ALLOW_UNFREE 1
    '';

    shellAliases = {
      # Other Aliases
      cd = "z";
      cat = "${pkgs.bat}/bin/bat";
      nvim = "nix run github:Jhuan-Nycolas/Nvim";
      lvim = "nix run ~/Nvim";
      hw = "nh home switch ${flake}/home-manager";
      nw = "nh os switch ${flake}/nixos";
      c = "clear";
      sdflogin = "clear; ssh jhuan@tty.sdf.org";
      testwifi = "nmcli | grep 192.168.100.122; sleep 1; clear; testwifi";

      # Ls Aliases
      ls = "exa --icons";
      l = "exa --tree --icons";
      lt = "exa -all --long --icons";
      ll = "l --tree --icons";
    };
  };
}
