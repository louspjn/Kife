{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  waybarCss = ''
    * {
      border: none;
      border-radius: 0;

      padding: 2px 3px;

      font-weight: 600;
    }

    window#waybar {
      border-radius: 100px;
    }

    #workspaces button {
      border-radius: 6px;
      border-bottom-left-radius: 0;
      border-bottom-right-radius: 0;
    }

    #clock {
      margin: 0px 8px;
    }

    #custom-logo {
      margin-left: 10px;
    }

    #battery {
      margin-right: 10px;
    }
  '';

  cfg = config.desktop.windowManagers;
in {
  options.desktop.windowManagers = {
    hyprland = {
      enable = mkEnableOption "Hyrpland";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = import ./configs/hyprland.nix;
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

      style = mkOption {
        type = types.str;
        default = waybarCss;
        description = "Waybar Css";
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
        style = cfg.statusbar.waybar.style;
      };
    };

    home.packages = mkIf (cfg.wallpaper.waypaper.enable) [
      pkgs.swww
      pkgs.waypaper
    ];
  };
}
