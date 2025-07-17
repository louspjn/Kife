{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
  inputs.flake.lib.eachDefaultSystem (system:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
    in {
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          ghc
          haskellPackages.haskell-language-server
          stack
        ];

        shellHook = "nu";
      };
    }
  );
}
