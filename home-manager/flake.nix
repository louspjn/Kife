{
  description = "Home Manager configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    reop.url = "github:Jhuan-Nycolas/Reop";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    reop,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."Hypr" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./hosts/hyprland/home.nix
        ./hosts/default/home.nix
        reop.homeManagerModules.reop
      ];
    };

    homeConfigurations."Plasma" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./hosts/default/home.nix
        reop.homeManagerModules.reop
      ];
    };
  };
}
