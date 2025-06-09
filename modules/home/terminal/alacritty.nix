{
  config,
  pkgs,
  lib,
  ...  
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.terminal.emulators.alacritty;
in {
  options.terminal.emulators.alacritty = {
    enable = mkEnableOption "Alacritty";

    package = mkOption {
      type = types.package;
      default = pkgs.alacritty;
      description = "Package to use";
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = import ./configs/alacritty.nix {inherit lib;};
      description = "Configuration for Alacritty";
    };
  };

  config = {
    programs.alacritty = {
      enable = cfg.enable;
      package = cfg.package;
      settings = cfg.settings;
    };
  };
}
