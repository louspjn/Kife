{ inputs, ... }:
let
  global = {
    mkNixos =
      {
        version ? "25.05",
        args ? null,
        path,
        extraModules ? [ ],
        ...
      }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = args;
        modules = [ path ] ++ extraModules;
        system.stateVersion = version;
      };
  };
in
{
  imports = [
    (import ./flake.nix { inherit inputs global; })
  ];
}
