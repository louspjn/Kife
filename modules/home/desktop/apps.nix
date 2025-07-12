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
      (mkIf (cfg.discord.enable) [pkgs.discord])
      (mkIf (cfg.spotify.enable) [pkgs.spotify])
      (mkIf (cfg.vscode) [pkgs.vscode])

      (mkIf (cfg.discord.enable && cfg.discord.equibop) [pkgs.equibop])
      (mkIf (cfg.spotify.enable && cfg.spotify.spicetify) [pkgs.spotify pkgs.spicetify-cli])
    ];
  };
}
