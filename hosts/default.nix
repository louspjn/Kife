{inputs, ...}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  overlays = ../overlays;
  options = ../modules/extra;

  homes.haskex = ../homes/haskex;
in {
  nixosConfigurations = {
    NaN = nixosSystem {
      specialArgs = {
        inherit
          inputs
          overlays
          homes
          ;
      };

      modules = [
        ./NaN
        options
      ];

      system.stateVersion = "25.05";
    };
  };
}
