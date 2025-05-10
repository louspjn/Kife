{stdenvNoCC, ...}:
stdenvNoCC.mkDerivation {
  name = "myWallpapers";

  src = ./images;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/images/
    cp -r $src/* $out/share/images/
  '';
}
