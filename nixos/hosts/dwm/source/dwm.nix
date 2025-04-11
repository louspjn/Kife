{
  stdenv,
  libX11,
  libXft,
  libXinerama,
  pkg-config,
  lib,
}:
stdenv.mkDerivation {
  pname = "dwm";
  version = "6.4";

  src = ./src;

  buildInputs = [libX11 libXft libXinerama];
  nativeBuildInputs = [pkg-config];

  makeFlags = ["CC=${stdenv.cc.targetPrefix}cc"];

  installPhase = ''
    mkdir -p $out/bin
    cp -f dwm $out/bin/
  '';

  meta = {
    description = "My custom DWM build";
    homepage = "https://dwm.suckless.org/";
    license = lib.licenses.mit;
    maintainers = with stdenv.lib.maintainers; [];
    platforms = stdenv.lib.platforms.linux;
  };
}
