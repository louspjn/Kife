{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  name = "nitch";
  src = ./.;

  buildInputs = with pkgs; [
    nim
    nimble
  ];

  buildPhase = ''
    nimble build -y
  '';
}
