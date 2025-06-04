{
  lib,
  config,
  inputs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.desktop.browsers.zen;
in {
  options.desktop.browsers.zen = {
    enable = mkEnableOption "Zen Browser";
  };

  config = mkIf (cfg.enable) {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
    };
  };
}
