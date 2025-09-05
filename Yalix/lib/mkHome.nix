{
  inputs,
  pkgs,
  lib,
  hm,
}: {
  name,
  modules ? [],
  args ? {},
  selfPackages ? []
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

          packages = selfPackages;
        };
      }

      ../homes/${name}/home.nix
    ];
}
