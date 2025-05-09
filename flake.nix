{
  description = "NotANumber Configuration";

  outputs = inputs: let
    nixosSystem = inputs.nixpkgs.lib.nixosSystem;
  in {
    nixosConfigurations.NaN = nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./lib
        ./system
        inputs.home-manager.nixosModules.home-manager
      ];

      system.stateVersion = "25.05";
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    reop.url = "github:haskex/reop";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager.url = "github:nix-community/home-manager";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };
}
