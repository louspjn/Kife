{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.desktop.browsers.opera;
in {
  options.desktop.browsers.opera = {
    enable = mkEnableOption "Opera";
  };

  config = mkIf (cfg.enable) {
    home.packages = [pkgs.opera];
  };
}
