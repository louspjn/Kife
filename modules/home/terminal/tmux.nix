{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.terminal.multiplexers.tmux;
in {
  options.terminal.multiplexers.tmux = {
    enable = mkEnableOption "tmux multiplexer";

    plugins = mkOption {
      type = types.listOf types.package;
      default = [pkgs.tmuxPlugins.catppuccin];
      description = "Tmux plugins";
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = import ./configs/tmux.nix;
      description = "Tmux Configuration";
    };
  };

  config = mkIf (cfg.enable) {
    programs.tmux =
      {
        enable = true;

        plugins = cfg.plugins;
      }
      // cfg.settings;
  };
}
