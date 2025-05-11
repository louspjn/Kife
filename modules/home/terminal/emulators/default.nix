{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.terminal.emulators;
in {
  options.terminal.emulators.kitty = {
    enable = mkEnableOption {
      default = false;
      description = "Whether to use kitty terminal";
    };

    useDefaultConfig = mkEnableOption {
      default = false;
      description = "Use default kitty config";
    };
  };

  config = {
    programs.kitty = {
      enable = cfg.kitty.enable;

      settings = mkIf (cfg.kitty.useDefaultConfig) {
        cursor_trail = 4;
        cursor_trail_start_threshold = 0;

        window_padding_width = 10;
        background_opacity = lib.mkDefault 0.9;
      };
    };
  };
}
