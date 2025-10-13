{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    wrappers.url = "github:lassulus/wrappers";
    hjem.url = "github:feel-co/hjem";
  };

  outputs = inputs @ { parts, nixpkgs, ... }:
    parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [./wrappers.nix];

      flake.nixosConfigurations.Kife = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        
        modules = [
          ./modules/host/config.nix
          ./modules/user/hjem.nix
          inputs.hjem.nixosModules.default
        ];
      };
    };
}
