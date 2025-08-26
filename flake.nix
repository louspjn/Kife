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

    mkAgsPackage = {name, deps}: pkgs.stdenv.mkDerivation {
      name = name;
      src = ./dotfiles/Ags/${name}/.;

      nativeBuildInputs = with pkgs; [
        wrapGAppsHook
        gobject-introspection
        inputs.ags.packages.${system}.default
      ];

      buildInputs = [
        pkgs.libadwaita
        pkgs.libsoup_3
        pkgs.gjs
      ] ++ deps;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/bin
        mkdir -p $out/share
        cp -r * $out/share
        ags bundle app.ts $out/bin/${name} -d "SRC='$out/share'"

        runHook postInstall
      '';
    };
  in
    parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        (import ./hosts.nix {
          inherit
            nixpkgs
            inputs
            self
            lib
            hm
            ;
        })
      ];

      perSystem = {pkgs, system, ...}: {
        packages = {
          yanot = mkAgsPackage {
            name = "yanot";

            deps = with inputs.ags.packages.${system}; [
              io
              astal4
              notifd
            ];
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    parts.url = "github:hercules-ci/flake-parts";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
