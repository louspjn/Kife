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
      default = import ./configs/kitty.nix;
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
