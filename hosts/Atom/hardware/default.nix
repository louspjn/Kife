{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./sound.nix
    ./wireless.nix

    inputs.disko.nixosModules.disko
  ];
}
