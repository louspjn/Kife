{inputs, ...}: {
  imports = [
    ./modules/icons.nix
    ./modules/stylix.nix

    inputs.stylix.homeManagerModules.stylix
  ];
}
