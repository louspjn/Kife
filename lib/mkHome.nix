{
  inputs,
  pkgs,
  lib,
  hm,
}: {
  name,
  modules ? [],
}:
hm.lib.homeManagerConfiguration {
  inherit pkgs;

  modules =
    modules
    ++ [
      (import ./home.nix {
        inherit name;
      })
      ../homes/${name}/home.nix
    ];
}
