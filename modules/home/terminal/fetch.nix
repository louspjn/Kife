{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkMerge mkEnableOption;

  cfg = config.terminal.fetch;
in {
  options.terminal.fetch = {
    nitch.enable = mkEnableOption "Nitch";
    microfetch.enable = mkEnableOption "Microfetch";
  };

  config = mkMerge [
    (mkIf (cfg.nitch.enable) {home.packages = [pkgs.nitch];})
    (mkIf (cfg.microfetch.enable) {home.packages = [pkgs.microfetch];})
  ];
}
