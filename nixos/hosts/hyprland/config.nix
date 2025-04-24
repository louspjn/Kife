{pkgs, ...}: {
  imports = [
    ./modules/interface.nix
    ./modules/cursor.nix
  ];
}
