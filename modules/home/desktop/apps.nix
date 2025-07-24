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

    spotify = mkEnableOption "Spotify";

    vscode = mkEnableOption "Visual Studio Code";
  };

  config = {
    home.packages = mkMerge [
      (mkIf (cfg.discord.enable && !cfg.discord.equibop) [pkgs.discord])
      (mkIf (cfg.spotify) [pkgs.spotify])
      (mkIf (cfg.vscode) [pkgs.vscode])

      (mkIf (cfg.discord.enable && cfg.discord.equibop) [pkgs.equibop])
    ];
  };
}
