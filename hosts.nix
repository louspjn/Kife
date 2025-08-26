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
      selfPackages = with self.packages.x86_64-linux; [
        yanot
      ];
    };

    nixosModules.default = ./modules/system;
  };
}
