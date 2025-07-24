{inputs, lib, ...}: let
  global = {
    mkNixos = {
      version ? "25.05",
      args ? null,
      path,
      extraModules ? [],
      ...
    }:  lib.nixosSystem {
      specialArgs = args;
      modules = [path] // extraModules;
      system.stateVersion = version;
    };
  };
in {
  imports = [
    (import ./flake.nix {inherit inputs global;})
  ];
}
