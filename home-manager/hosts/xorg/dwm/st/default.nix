{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "st";
  version = "0.9.2";

  src = ./src;

  nativeBuildInputs = [pkgs.pkg-config];
  buildInputs = [
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.fontconfig
    pkgs.freetype
    pkgs.gnumake
    pkgs.ncurses
  ];

  installPhase = ''
    mkdir -p $out/bin
    make PREFIX=$out install
  '';
}
