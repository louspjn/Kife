let
  pkgs = import <nixpkgs> {};
in
  pkgs.callPackage ./dwm.nix {}
