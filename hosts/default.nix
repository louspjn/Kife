{inputs, ...}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  overlays = ../overlays;
  options = ../modules/extra;

  homes.haskex = ../homes/haskex;
in {
  nixosConfigurations = {
    Earth = nixosSystem {
      specialArgs = {
        inherit
          inputs
          overlays
          homes
          ;
      };

      modules = [
        ./Earth
        options
      ];

      system.stateVersion = "25.05";
    };
  };
}
