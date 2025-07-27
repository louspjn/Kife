{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "coffee";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXft
    freetype
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp st $out/bin/coffee
  '';
}
