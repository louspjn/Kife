{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.desktop.windowManagers;
in {
  options.desktop.windowManagers = {
    hyprland = {
      enable = mkEnableOption "Hyrpland";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = import ./configs/hyprland.nix {inherit pkgs;};
        description = "Hyprland Configuration";
      };
    };

    lockscreen.hyprlock = {
      enable = mkEnableOption "Hyprlock";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = {};
        description = "Hyprland Configuration";
      };
    };

    statusbar.waybar = {
      enable = mkEnableOption "Waybar";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = import ./configs/waybar.nix;
        description = "Waybar Configuration";
      };
    };

    wallpaper = {
      waypaper = {
        enable = mkEnableOption "Waypaper";
      };
    };
  };

  config = {
    wayland.windowManager.hyprland = {
      enable = cfg.hyprland.enable;

      settings = cfg.hyprland.settings;
    };

    programs = {
      hyprlock = {
        enable = cfg.lockscreen.hyprlock.enable;

        settings = cfg.lockscreen.hyprlock.settings;
      };

      waybar = {
        enable = cfg.statusbar.waybar.enable;
        settings = cfg.statusbar.waybar.settings;
      };
    };

    home.packages = mkIf (cfg.wallpaper.waypaper.enable) [
      pkgs.swww
      pkgs.waypaper
    ];
  };
}
