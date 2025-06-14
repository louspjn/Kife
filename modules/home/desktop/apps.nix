{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.desktop.apps;
in {
  options.desktop.apps = {
    discord = mkEnableOption "Discord";

    spotify = mkEnableOption "Spotify";
  };

  config = {
    home.packages =
      mkIf (cfg.discord) [pkgs.discord] //
      mkIf (cfg.spotify) [pkgs.spotify];
  };
}
