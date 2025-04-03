{ stdenv, fetchFromGitHub, python3 }:

stdenv.mkDerivation {
  pname = "reop";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Jhuan-Nycolas";
    repo = "Reop";
    rev = "main";
    sha256 = "sha256-mE6GixRx8czb/669luXX/i5p0dO4DMsVTiXWiSXelpA=";
  };

  buildInputs = [ python3 ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/* $out/bin/
    echo '#!/usr/bin/env python3' > $out/bin/reop
    echo 'exec(open("'"$out/bin/open.py"'").read())' >> $out/bin/reop
    chmod +x $out/bin/reop
  '';
}
