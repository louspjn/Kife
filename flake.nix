{
  description = "SagittariusOS Configuration";

  outputs = {
    nixpkgs,
    hm,
    parts,
    ...
  } @ inputs:
    let
      lib = nixpkgs.lib // {
        mkNixos = import ./lib/mkNixos.nix {
          lib = nixpkgs.lib;
          inherit inputs;
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
        };
      };
    in
    parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      
      flake = {
        # nixosConfigurations.SagittariusOS = nixpkgs.lib.nixosSystem {
        #   specialArgs = {inherit inputs;};
        #   system = "x86_64-linux";

        #   modules = [
        #     ./config.nix
        #   ];
        # };

        nixosConfigurations.SagittariusOS = lib.mkNixos {
          name = "SagittariusOS";
        };

        homeConfigurations.lousp = hm.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {system = "x86_64-linux";};

          modules =
            (with inputs; [
              spicetify.homeManagerModules.default
              stylix.homeModules.stylix
            ])
            ++ [
              ./lousp/home.nix
            ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    spicetify.url = "github:Gerg-L/spicetify-nix";

    parts.url = "github:hercules-ci/flake-parts";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
