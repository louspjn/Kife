{
  inputs,
  pkgs,
  lib,
  hm,
}: {
  name,
  modules ? [],
  args ? {}
}:
hm.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = args;

  modules =
    modules
    ++ [
      {
        home = {
          username = name;
          homeDirectory = "/home/${name}";
          stateVersion = "25.11";
        };
      }

      ../homes/${name}/home.nix
    ];
}
