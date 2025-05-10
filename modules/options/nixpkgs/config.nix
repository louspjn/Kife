{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkMerge mkIf;
in {
  config = mkMerge [
    (mkIf (config.np.unfree) {
      nixpkgs.config.allowUnfree = true;
    })

    (mkIf (config.np.overlays.enable) {
      nixpkgs.overlays = map import config.np.overlays.paths;
    })

    (mkIf (config.np.defaultPackages) {
      environment.systemPackages =
        config.np.packages
        ++ [
          pkgs.bluez
          pkgs.libnotify
          pkgs.pulseaudio
          pkgs.nodejs
          pkgs.unzip
          pkgs.sqlite
          pkgs.home-manager
          pkgs.wget
        ];
    })

    (mkIf (!config.np.defaultPackages) {
      environment.systemPackages = config.np.packages;
    })
  ];
}
