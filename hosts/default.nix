{inputs, ...}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  overlays = ../overlays;
  options = ../modules/extra;

  homes.haskex = ../homes/haskex;
in {
  nixosConfigurations = {
    Atom = nixosSystem {
      specialArgs = {
        inherit
          inputs
          overlays
          homes
          ;
      };

      modules = [
        ./Atom
        options
      ];

      system.stateVersion = "25.05";
    };
  };
}
