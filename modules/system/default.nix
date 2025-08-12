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
      windowManager.hyprland.enable = mkEnableOption "Enable hyprland as Window Manager";

      displayManager = mkOption {
        type = types.attrsOf types.anything;
        description = "Display Managers Configuration";
        default = {};
      };
    };

    bootloader.grub = {
      enable = mkOption {
        type = types.bool;
        description = "Enable grub as bootloader";
        default = true;
      };

      efiSupport = mkEnableOption "Enable grub as bootloader";
      
      background = mkOption {
        type = types.path or null;
        description = "Background file to use in grub";
        default = null;
      };
    };

    sound.pipewire = {
      enable = mkEnableOption "Enable Pipewire as sound service";
      pulse.enable = mkEnableOption "Enable pulse suport for pipewire";
    };
  };

  config = {
    environment = {
      sessionVariables = config.env;
      systemPackages = config.packages;
    };

    services =
      {
        displayManager = config.desktop.displayManager;
      }
      // config.sound;

    boot = {
      loader.grub = {
        enable = config.bootloader.grub.enable;
        efiSupport = config.bootloader.grub.efiSupport;
        devices = ["nodev"];
        splashImage = config.bootloader.grub.background;
      };

      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
      ];
    };
  };
}
