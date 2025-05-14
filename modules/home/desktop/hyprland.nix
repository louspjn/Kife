{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.desktop.windowManagers.hyprland;
in {
  options.desktop.windowManagers.hyprland = {
    enable = mkEnableOption "Hyrpland";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = import ./configs/hyprland.nix {inherit pkgs;};
      description = "Hyprland Configuration";
    };
  };

  config = mkIf (cfg.enable) {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = cfg.settings;
    };
  };
}
