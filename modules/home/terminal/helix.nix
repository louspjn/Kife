{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkOption types;

  cfg = config.terminal.editors.helix;
in {
  options.terminal.editors.helix = mkOption {
    type = types.attrsOf types.anything;
    default = import ./config/helix.nix {inherit pkgs;};
    description = "Helix Editor Configuration";
  };

  config = {
    programs.helix = cfg;
  };
}
