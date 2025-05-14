{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.file-managers.yazi;
in {
  options.terminal.file-managers.yazi = {
    enable = mkEnableOption "yazi file manager";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = import ./configs/yazi.nix;
      description = "Yazi Configuration";
    };
  };

  config = mkIf (cfg.enable) {
    programs.yazi = {
      enable = true;

      settings = cfg.settings;
    };
  };
}
