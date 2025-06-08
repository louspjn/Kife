{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.desktop.discord;
in {
  options.desktop.discord = {
    enable = mkEnableOption "Discord";
  };

  config = mkIf (cfg.enable) {
    home.packages = [pkgs.discord];
  };
}
