{inputs, ...}: {
  imports = [
    ./environment.nix
    ./packages.nix
    ./services.nix
    ./users.nix

    inputs.home-manager.nixosModules.home-manager
  ];
}
