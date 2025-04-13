{ pkgs, ... }:

{
  home.packages = [
    pkgs.xorg.libX11
  ];
}
