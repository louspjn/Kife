{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./sound.nix
    ./wireless.nix
    ./disko.nix

    inputs.disko.nixosModules.disko
  ];
}
