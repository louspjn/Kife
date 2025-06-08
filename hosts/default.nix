{inputs, ...}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  overlays = ../overlays;

  homes.haskex = ../homes/haskex;
in {
  nixosConfigurations = {
    Husk = nixosSystem {
      specialArgs = {
        inherit
          inputs
          overlays
          homes
          ;
      };

      modules = [
        ./Husk

        inputs.self.nixosModules.all
      ];

      system.stateVersion = "25.05";
    };

    minimal = nixosSystem {
      modules = [
        ./minimal/config.nix
        ./minimal/hardware.nix
      ];

      system.stateVersion = "25.05";
    };
  };
}
