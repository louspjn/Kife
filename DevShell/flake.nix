{
  description = "DevShells";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system} = {
      Maven = pkgs.mkShell {
        buildInputs = [
          pkgs.openjdk
          pkgs.maven
        ];
      };

      Yarn = pkgs.mkShell {
        buildInputs = [
          pkgs.yarn
        ];
      };
    };
  };
}

