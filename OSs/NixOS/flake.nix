{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    hjem.url = "github:feel-co/hjem";
  };

  outputs = inputs @ { parts, nixpkgs, ... }:
    parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      flake.nixosConfigurations.Kife = nixpkgs.lib.nixosSystem {
        modules = [
          ./modules/host/config.nix
          ./modules/user/hjem.nix
          inputs.hjem.nixosModules.default
        ];
      };
    };
}
