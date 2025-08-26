{
  inputs,
  self,
  lib,
  ...
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
        stylix.homeModules.stylix
      ];
    };

    nixosModules.default = ./modules/system;
  };
}
