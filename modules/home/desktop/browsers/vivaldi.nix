{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.desktop.browsers.vivaldi;
in {
  options.desktop.browsers.vivaldi = {
    enable = mkEnableOption "Vivaldi Browser";
  };

  config = mkIf (cfg.enable) {
    home.packages = [pkgs.vivaldi];
  };
}
