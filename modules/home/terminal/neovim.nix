{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.terminal.editors.neovim;
  nvf = cfg.nvf;
in {
  options.terminal.editors.neovim = {
    enable = mkEnableOption "neovim";

    nvf = {
      enable = mkEnableOption "nvf to configure neovim";

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = import ./configs/neovim.nix;
        description = "Nvf Configuration";
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
