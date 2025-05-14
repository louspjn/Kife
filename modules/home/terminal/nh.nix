{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.nh;
in {
  options.terminal.nh = {
    enable = mkEnableOption "Enable nh";

    flake = mkOption {
      type = types.str;
      default = "";
      description = "Flake used for nh";
    };
  };

  config = mkIf (cfg.enable) {
    programs.nh = {
      enable = true;
    };

    programs.nushell.extraConfig = ";$env.NH_FLAKE = '${cfg.flake}';";
  };
}
