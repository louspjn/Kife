{
  description = "System's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @inputs:
  {
    nixosConfigurations = {
      Plasma = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/plasma/configuration.nix ];
      };

      I3wm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/i3wm/configuration.nix ];
      };

      Jhuan = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/hyprland/configuration.nix ];
      };
    };
  };
}
