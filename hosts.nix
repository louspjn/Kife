{
  nixpkgs,
  inputs,
  self,
  lib,
  hm,
}: {
  flake = {
    nixosConfigurations = {
      Aio = lib.mkNixos {
        name = "Aio";
        variables = {
          assets = {
            wallpapers = ./assets/wallpapers;
          };
        };
        modules = [
          self.nixosModules.default
        ];
      };
    };

    homeConfigurations.lousp = lib.mkHome {
      name = "lousp";
      modules = with inputs; [
        spicetify.homeManagerModules.default
        stylix.homeModules.stylix
        # nvf.homeManagerModules.default
      ];
    };

    nixosModules.default = ./modules/system;
  };
}
