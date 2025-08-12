{
  nixpkgs,
  inputs,
  pkgs,
  hm,
}:
nixpkgs.lib
// {
  mkNixos = import ./mkNixos.nix {
    lib = nixpkgs.lib;
    inherit inputs pkgs;
  };

  mkHome = import ./mkHome.nix {
    lib = nixpkgs.lib;
    inherit inputs hm pkgs;
  };
}
