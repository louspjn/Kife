{inputs, ...}: {
  imports = [
    ./environment.nix
    ./packages.nix
    ./services
    ./users.nix

    inputs.home-manager.nixosModules.home-manager
  ];
}
