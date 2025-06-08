{config, ...}: let
  cfg = config.terminal.editors.helix;
in {
  options.terminal.editors.helix = {};

  config = {
    programs.helix = cfg;
  };
}
