{
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "wallpapers";

  src = fetchFromGitHub {
    owner = "haskex";
    repo = "Wallpapers";
    rev = "main";
    hash = "sha256-T3f3qYN7PnXfXpRCih4AIKhV1YfL/YQH24N9dUn5ABc=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/images/
    cp -r $src/* $out/share/images/
  '';
}
