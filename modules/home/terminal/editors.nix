{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.terminal.editors;
  nvf = cfg.nvf;
in {
  options.terminal.editors = {
    emacs.enable = mkEnableOption "Emacs";
  
    neovim = {
      enable = mkEnableOption "NeoVim";

      nvf = {
        enable = mkEnableOption "NVF to configure NeoVim";

        settings = mkOption {
          type = types.attrsOf types.anything;
          default = import ./configs/neovim.nix;
          description = "Nvf Configuration";
        };
      };
    };
  };

  config = {
    programs = mkIf (cfg.neovim.enable) {
      nvf = {
        enable = mkIf (nvf.enable) true;

        settings = nvf.settings;
      };

      neovim = {
        enable = !nvf.enable;
      };
    };

    home.packages = mkIf (cfg.emacs.enable) [
      pkgs.emacs
    ];
  };
}
