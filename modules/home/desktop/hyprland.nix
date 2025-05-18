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

    hyprlock = {
      enable = mkEnableOption "Hyprlock";

      settings = mkOption {
        type = types.attrsOf types.anything;
        description = "Hyprland Configuration";
      };
    };

    waybar = {
      enable = mkEnableOption "Waybar";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = import ./configs/waybar.nix {inherit pkgs;};
        description = "Waybar Configuration";
      };
    };

    wallpaper = {
      waypaper = {
        enable = mkEnableOption "Waypaper";
      };
    };
  };

  config = mkIf (cfg.enable) {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = cfg.settings;
    };

    programs = {
      hyprlock = {
        enable = cfg.hyprlock.enable;

        settings = cfg.hyprlock.settings;
      };

      waypaper = {
        enable = cfg.wallpaper.waypaper.enable;
      };

      waybar = {
        enable = cfg.waybar.enable;
        settings = cfg.waybar.settings;
      };
    };

    home.packages = mkIf (cfg.wallpaper.waypaper.enable) [pkgs.swww];
  };
}
