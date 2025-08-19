{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkOption
    types
    ;
in {
  options = {
    env = mkOption {
      type = types.attrsOf types.str or null;
      description = "Evironment Variables";
      default = null;
    };

    packages = mkOption {
      type = types.listOf types.package or null;
      description = "System Packages";
      default = null;
    };

    desktop = {
      windowManager = mkOption {
        type = types.attrsOf types.anything;
        description = "Window Managers Configuration";
        default = {};
      };

      desktopManager = mkOption {
        type = types.attrsOf types.anything;
        description = "Desktop Managers Configuration";
        default = {};
      };

      displayManager = mkOption {
        type = types.attrsOf types.anything;
        description = "Display Managers Configuration";
        default = {};
      };
    };

    sound.pipewire = mkOption {
      type = types.attrsOf types.anything;
      description = "Option for the pipewire module";
      default = {};
    };
  };

  config = {
    environment = {
      sessionVariables = config.env;
      systemPackages = config.packages;
    };

    services = {
      displayManager = config.desktop.displayManager;
      desktopManager = config.desktop.desktopManager;
      pipewire = config.sound.pipewire;
    };

    programs = config.desktop.windowManager;
  };
}
