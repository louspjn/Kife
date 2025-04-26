{
  description = "Home Manager configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    reop.url = "github:Jhuan-Nycolas/Reop";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    reop,
    zen-browser,
    ...
  }: let
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
  };
}
