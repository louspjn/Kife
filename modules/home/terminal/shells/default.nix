{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkOption types mkEnableOption;

  cfg = config.terminal.shells;
in {
  options.terminal.shells.nushell = {
    enable = mkEnableOption {
      default = false;
      description = "Whether to use nushell";
    };

    useDefaultConfig = mkEnableOption {
      default = false;
      description = "Use default kitty config";
    };

    aliases = mkOption {
      type = types.attrsOf types.str;
      description = "Shell aliases";
      default = {};
    };

    nhFlake = mkOption {
      type = types.str;
      description = "Flake for nh";
    };

    extraConfig = mkOption {
      type = types.str;
      description = "Extra nushell configuration";
      default = "";
    };
  };

  config = {
    programs.nushell = {
      enable = cfg.nushell.enable;

      shellAliases = cfg.nushell.aliases;

      settings = mkIf (cfg.nushell.useDefaultConfig) {
        edit_mode = "vi";
        table.mode = "rounded";

        buffer_editor = "nvim";
        show_banner = false;
      };

      extraConfig = "$env.NH_FLAKE = '${cfg.nushell.nhFlake}';" + cfg.nushell.extraConfig;
    };
  };
}
