{
  stdenv,
  fetchFromGitHub,
  python3,
}:
stdenv.mkDerivation {
  pname = "reop";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Jhuan-Nycolas";
    repo = "Reop";
    rev = "main";
    sha256 = "1s5ikck1ibggg78qfpcbamjnj548jdnhykdk4d02s6pckbz47d2m";
  };

  buildInputs = [python3];

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/* $out/bin/
    echo '#!/usr/bin/env python3' > $out/bin/reop
    echo 'exec(open("'"$out/bin/open.py"'").read())' >> $out/bin/reop
    chmod +x $out/bin/reop
  '';
}
