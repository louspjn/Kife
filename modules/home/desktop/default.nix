{inputs, ...}: {
  imports = [
    ./browsers
    ./menus/rofi.nix
    ./windowManagers.nix
    ./stylix.nix
    ./apps.nix

    inputs.stylix.homeModules.stylix
  ];
}
