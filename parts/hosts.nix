{
  inputs,
  lib,
  nixpkgs,
  hm,
}: {
  flake = {
    nixosConfigurations.SagittariusOS = lib.mkNixos {
      name = "SagittariusOS";
    };

    homeConfigurations.lousp = lib.mkHome {
      name = "lousp";
      modules = with inputs; [
        spicetify.homeManagerModules.default
        stylix.homeModules.stylix
      ];
    };
  };
}
