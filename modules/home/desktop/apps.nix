{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkMerge mkEnableOption;

  cfg = config.desktop.apps;
in {
  options.desktop.apps = {
    discord = mkEnableOption "Discord";

    spotify = mkEnableOption "Spotify";
  };

  config = {
    home.packages = mkMerge [
      (mkIf (cfg.discord) [pkgs.discord])
      (mkIf (cfg.spotify) [pkgs.spotify])
    ];
  };
}
