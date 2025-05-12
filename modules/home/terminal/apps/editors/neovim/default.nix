{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.terminal.apps.editors.neovim;
  nvf = cfg.nvf;
in {
  options.terminal.apps.editors.neovim = {
    enable = mkEnableOption "Whether to enable neovim";

    nvf = {
      enable = mkEnableOption "Use nvf to configure neovim";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = {};
        description = "Nvf Configurations";
      };
    };
  };

  config = {
    programs = mkIf (cfg.enable) {
      nvf = {
        enable = mkIf (nvf.enable) true;

        settings = nvf.settings;
      };

      neovim = {
        enable = !nvf.enable;
      };
    };
  };
}
