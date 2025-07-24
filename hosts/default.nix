{ config, ... }: {
  flake.nixosConfigurations = {
    LouspOS = config.global.mkNixos {
      path = ./LouspOS;
      args = {
        inherit (config) inputs;
      };
    };
  };
}
