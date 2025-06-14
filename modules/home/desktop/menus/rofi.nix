{
  config,
  lib,
  ...
}: let
  inherit (lib) types mkEnableOption mkOption;

  cfg = config.desktop.menus.rofi;
in {
  options.desktop.menus.rofi = {
    enable = mkEnableOption "Rofi Menu";

    config = mkOption {
      type = types.attrsOf types.anything;
      default = import ../configs/rofi.nix;
      description = "Rofi Configuration";
    };
  };

  config = {
    programs.rofi = {
      enable = cfg.enable;
    } // cfg.config;
  };
}
