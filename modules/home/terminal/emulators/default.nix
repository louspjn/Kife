{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.terminal.emulators.kitty;
in {
  options.terminal.emulators.kitty = {
    enable = mkEnableOption "Whether to use kitty terminal";

    useDefaultConfig = mkEnableOption "Use default kitty config";
  };

  config = mkIf (cfg.enable) {
    programs.kitty = {
      enable = true;

      settings = mkIf (cfg.useDefaultConfig) {
        cursor_trail = 4;
        cursor_trail_start_threshold = 0;

        window_padding_width = 10;
        background_opacity = lib.mkDefault 0.9;
      };
    };
  };
}
