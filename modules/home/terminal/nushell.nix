{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkOption types mkEnableOption;

  cfg = config.terminal.shells.nushell;

  fetch =
    if (config.terminal.fetch.nitch.enable)
    then "nitch"
    else if (config.terminal.fetch.microfetch.enable)
    then "microfetch"
    else "";
in {
  options.terminal.shells.nushell = {
    enable = mkEnableOption "nushell";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = import ./configs/nushell/settings.nix;
    };

    aliases = mkOption {
      type = types.attrsOf types.str;
      description = "Shell aliases";
      default = import ./configs/nushell/aliases.nix {inherit pkgs;};
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

      settings = cfg.settings;

      extraConfig = cfg.extraConfig + ";${fetch};";
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
