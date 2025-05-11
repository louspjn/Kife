{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.terminal.apps;
in {
  options.terminal.apps.git = {
    enable = mkEnableOption "Enable Git";
  };

  config = mkIf (cfg.git.enable) {
    programs.git = {
      enable = true;

      userName = "Jhuan-Nycolas";
      userEmail = "jhuan2024@hotmail.com";
      extraConfig = {
        credential.helper = "store";
      };
    };
  };
}
