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
    discord = {
      enable = mkEnableOption "Discord";
      equibop = mkEnableOption "Equibop Client";
    };

    spotify = {
      enable = mkEnableOption "Spotify";
      spicetify = mkEnableOption "Spicetify CLI";
    };

    vscode = mkEnableOption "Visual Studio Code";
  };

  config = {
    home.packages = mkMerge [
      (mkIf (cfg.discord) [pkgs.discord])
      (mkIf (cfg.spotify) [pkgs.spotify])
      (mkIf (cfg.vscode) [pkgs.vscode])
    ];
  };
}
