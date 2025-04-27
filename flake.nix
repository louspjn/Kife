{
  description = "Setup configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    reop.url = "github:haskex/reop";

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

  outputs = {
    nixpkgs,
    home-manager,
    reop,
    zen-browser,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."haskex" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./config/home.nix
        reop.homeManagerModules.reop
        zen-browser.homeModules.beta
      ];
    };

    nixosConfigurations = {
      "Jhuan" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};

        modules = [
          ./config/config.nix
        ];
      };
    };
  };
}
