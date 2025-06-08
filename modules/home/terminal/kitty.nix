{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.emulators.kitty;
in {
  options.terminal.emulators.kitty = {
    enable = mkEnableOption "kitty terminal";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = {
        cursor_trail = 4;
        cursor_trail_start_threshold = 0;

        window_padding_width = 10;
      };
      description = "Kitty Configuration";
    };
  };

  config = mkIf (cfg.enable) {
    programs.kitty = {
      enable = true;

      settings = cfg.settings;
    };
  };
}
