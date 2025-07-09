{inputs, ...}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  overlays = ../overlays;

  homes.lousp = ../homes/lousp;
in {
  nixosConfigurations = {
    LouspOS = nixosSystem {
      specialArgs = {
        inherit
          inputs
          overlays
          homes
          ;
      };

      modules = [
        ./LouspOS

        inputs.self.nixosModules.all
      ];

      system.stateVersion = "25.05";
    };
  };
}
