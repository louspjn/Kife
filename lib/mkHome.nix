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
      ../homes/${name}/home.nix
    ];
}
