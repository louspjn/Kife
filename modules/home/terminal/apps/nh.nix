{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.apps.nh;
in {
  options.terminal.apps.nh = {
    enable = mkEnableOption "Enable Git";

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
