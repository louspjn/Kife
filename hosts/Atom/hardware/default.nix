{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./disko.nix
    ./sound.nix
    ./wireless.nix

    inputs.disko.nixosModules.disko
  ];
}
