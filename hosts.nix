{
  nixpkgs,
  inputs,
  self,
  lib,
  hm,
}: {
  flake = {
    nixosConfigurations = {
      SagittariusOS = lib.mkNixos {
        name = "SagittariusOS";
        variables = {
          assets = {
            sddm = ./assets/sddm;
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
      ];
    };

    nixosModules.default = ./modules/system;
  };
}
