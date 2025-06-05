{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.desktop.style;
in {
  options.desktop.style = {
    enable = mkEnableOption "Stylix";

    stylix = mkOption {
      type = types.attrsOf types.anything;
      default = import ./configs/stylix.nix {inherit pkgs;};
      description = "Stylix Configuration";
    };

    iconTheme = {
      name = mkOption {
        type = types.str;
        default = "Papirus";
        description = "Icon Theme name";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.papirus-icon-theme;
        description = "Icon Theme Package";
      };
    };
  };

  config = mkIf (cfg.enable) {
    stylix = cfg.stylix;
    gtk.iconTheme = cfg.iconTheme;
  };
}
