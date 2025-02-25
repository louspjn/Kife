{
  description = "System's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      Jhuan = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      kde-plasma = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

	modules = [
          ./hosts/kde-plasma/configuration.nix
	];
      };
    };
  };
}
