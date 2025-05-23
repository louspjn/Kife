{inputs, ...}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  overlays = ../overlays;

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
        inputs.self.nixosModules.all
      ];

      imports = [
        ./Atom
      ];

      system.stateVersion = "25.05";
    };
  };
}
