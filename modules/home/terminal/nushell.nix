{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkMerge mkOption types mkEnableOption;

  cfg = config.terminal.shells.nushell;
in {
  options.terminal.shells.nushell = {
    enable = mkEnableOption "nushell";

    useDefaultConfig = mkEnableOption "default config";

    aliases = mkOption {
      type = types.attrsOf types.str;
      description = "Shell aliases";
      default = {};
    };

    extraConfig = mkOption {
      type = types.str;
      description = "Extra nushell configuration";
      default = "";
    };

    oh-my-posh = {
      enable = mkEnableOption "oh-my-posh for theme prompt";

      theme = mkOption {
        type = types.str;
        default = "robbyrussell";
        description = "oh-my-posh theme";
      };
    };

    zoxide = {
      enable = mkEnableOption "zoxide";
    };
  };

  config = {
    programs.nushell = {
      enable = cfg.enable;

      shellAliases = cfg.aliases;

      settings = mkIf (cfg.useDefaultConfig) {
        edit_mode = "vi";
        table.mode = "rounded";

        buffer_editor = "nvim";
        show_banner = false;
      };

      extraConfig = cfg.extraConfig + ";nitch;";
    };

    programs = {
      oh-my-posh = {
        enable = cfg.oh-my-posh.enable && cfg.enable;
        enableNushellIntegration = cfg.oh-my-posh.enable;
        useTheme = cfg.oh-my-posh.theme;
      };

      zoxide = {
        enable = cfg.zoxide.enable && cfg.enable;
        enableNushellIntegration = cfg.zoxide.enable;
      };
    };
  };
}
