{
  description = "Not a Number Configuration";

  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    nixos = inputs.nixpkgs.lib.nixosSystem;

    homeManager = inputs.home-manager.lib.homeManagerConfiguration;
  in {
    homeConfigurations.haskex = homeManager {
      inherit pkgs;

      modules = [
        ./config/home.nix

        inputs.reop.homeManagerModules.reop
        inputs.zen-browser.homeModules.beta
        inputs.nvf.homeManagerModules.default
        inputs.stylix.homeManagerModules.stylix
      ];
    };

    nixosConfigurations.NaN = nixos {
      specialArgs = {inherit inputs;};

      modules = [
        ./config/config.nix
      ];
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    reop.url = "github:haskex/reop";

    nvf.url = "github:notashelf/nvf";

    stylix.url = "github:danth/stylix";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
