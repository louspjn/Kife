{inputs, global, ...}: {
  nixosConfigurations = {
    # LouspOS = nixosSystem {
    #   specialArgs = {
    #     inherit
    #       inputs
    #       overlays
    #       homes
    #       ;
    #   };

    #   modules = [
    #     ./LouspOS
    #     inputs.self.nixosModules.default
    #   ];

    #   system.stateVersion = "25.05";
    # };

    LouspOS = global.mkNixos {
      version = "25.05";
      args = { inherit global; };
      path = ./LouspOS;

      extraModules = [
        inputs.self.nixosModules.default
      ];
    };
  };
}
