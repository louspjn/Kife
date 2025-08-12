{
  description = "SagittariusOS Configuration";

  outputs = {
    nixpkgs,
    parts,
    self,
    hm,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    lib = import ./lib {
      inherit
        nixpkgs
        inputs
        pkgs
        hm
        ;
    };
  in
    parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        (import ./parts.nix {
          inherit
            nixpkgs
            inputs
            self
            lib
            hm
            ;
        })
      ];
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
