{
  description = "System's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... } @inputs:
  {
    nixosConfigurations = {
      Plasma = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/plasma/configuration.nix 

          inputs.stylix.nixosModules.stylix
        ];
      };

      I3wm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/i3wm/configuration.nix  

          inputs.stylix.nixosModules.stylix
        ];
      };

      Hypr = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/hyprland/configuration.nix 

          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
