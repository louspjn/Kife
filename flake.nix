{
  description = "LouspOS Configuration";

  outputs = { nixpkgs, hm, parts, ... }@inputs:
    parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      flake = {
        nixosConfigurations.LouspOS = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          system = "x86_64-linux";
          
          modules = [
            ./config.nix
          ];
        };

        homeConfigurations.lousp = hm.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {system = "x86_64-linux";};

          modules = [
            inputs.spicetify.homeManagerModules.default
            inputs.stylix.homeModules.stylix
          
            ./lousp/home.nix
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    spicetify.url = "github:Gerg-L/spicetify-nix";
    rpc.url = "github:ndom91/rose-pine-hyprcursor";

    parts.url = "github:hercules-ci/flake-parts";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hypr-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };


    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
