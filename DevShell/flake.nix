{
  description = "Ambientes de desenvolvimento Java e Maven";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
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
        
        shellHook = ''
          exec fish
        '';
      };

      Yarn = pkgs.mkShell {
        buildInputs = [
          pkgs.yarn
        ];

        shellHook = ''
          exec fish
        '';
      };
    };
  };
}

