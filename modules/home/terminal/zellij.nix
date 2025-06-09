{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.multiplexers.zellij;
in {
  options.terminal.multiplexers.zellij = {
    enable = mkEnableOption "Zellij Multiplexer";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = {};
      description = "Zellij Configuration";
    };
  };

  config = mkIf (cfg.enable) {
    programs.zellij = {
      enable = true;
      settings = cfg.settings;
    };
  };
}
