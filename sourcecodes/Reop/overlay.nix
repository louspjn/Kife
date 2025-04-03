self: super: {
  reop = super.stdenv.mkDerivation {
    pname = "reop";
    version = "1.0";
    src = ./.;

    buildInputs = [ super.python3 ];

    installPhase = ''
      mkdir -p $out/bin
      cp -r $src/* $out/bin/
      echo '#!/usr/bin/env python3' > $out/bin/reop
      echo 'exec(open('"'$out/bin/open.py'"').read())' >> $out/bin/reop
      chmod +x $out/bin/reop
    '';
  };
}
