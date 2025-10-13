{ inputs, ... }: let
  dotfiles = "/home/lousp/Kife/dotfiles";
in {
  perSystem = { pkgs, system, ... }: {
    packages = {
      zellij-wrapped = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.zellij;
        flags."--config-dir" = "${dotfiles}/zellij";
      };
    };
  };
}
