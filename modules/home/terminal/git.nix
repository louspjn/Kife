{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.git;
in {
  options.terminal.git = {
    enable = mkEnableOption "Git";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = {
        userName = "haskex";
        userEmail = "jhuan2024@hotmail.com";
        extraConfig = {
          credential.helper = "store";
        };
      };

      description = "Git Configuration";
    };
  };

  config = mkIf (cfg.enable) {
    programs.git =
      {
        enable = true;
      }
      // cfg.settings;
  };
}
