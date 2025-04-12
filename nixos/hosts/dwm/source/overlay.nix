self: super: {
  dwm = super.callPackage ./dwm.nix {
    stdenv = super.stdenv;
    libX11 = super.xorg.libX11;
    libXft = super.xorg.libXft;
    libXinerama = super.xorg.libXinerama;
    pkg-config = super.pkg-config;
    lib = super.lib;
  };
}
