{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.desktop.stylix;

  default = {
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };

      sizes = {
        terminal = 11;
        desktop = 10;
        applications = 11;
      };
    };

    targets = {
      nvf.enable = false;
      helix.enable = false;
      firefox.profileNames = ["default"];
    };
  };
in {
  options.desktop.stylix = {
    enable = mkEnableOption "Stylix";

    style = mkOption {
      type = types.enum ["dark" "light"];
      default = "dark";
      description = "Style of theme, dark or light";
    };

    theme = mkOption {
      type = types.str;
      default = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
      description = "Base16 Scheme";
    };

    font = mkOption {
      type = types.attrsOf types.anything;
      default = default.fonts;
      description = "Fonts";
    };

    iconTheme = {
      name = mkOption {
        type = types.str;
        default = "gruvbox-dark-icons-gtk";
        description = "Icon Theme name";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.gruvbox-dark-icons-gtk;
        description = "Icon Theme Package";
      };
    };

    targets = mkOption {
      type = types.attrsOf types.anything;
      default = default.targets;
      description = "Targets to disable or enable";
    };
  };

  config = mkIf (cfg.enable) {
    stylix = {
      enable = true;

      base16Scheme = cfg.theme;

      polarity = cfg.style;
      fonts = cfg.font;

      targets = cfg.targets;
    };

    gtk.iconTheme = cfg.iconTheme;
  };
}
