{ pkgs, lib, config, ... }:

let
  inherit (lib) mkOption mkIf types;
in
{
  options = {
    ulauncher = mkOption {
      type = types.submodule {
        options = {
          enable = mkOption {
            type = types.bool;
            default = false;
            description = "Enable Ulauncher";
          }; 

          settings = mkOption {
            type = types.submodule {
              options = {
                blacklisted-desktop-dirs = mkOption {
                  type = types.str;
                  default = "/usr/share/locale:/usr/share/app-install:/usr/share/kservices5:/usr/share/fk5:/usr/share/kservicetypes5:/usr/share/applications/screensavers:/usr/share/kde4:/usr/share/mimelnk";
                  description = "Blacklist of aplications directories";
                };

                clear-previous-query = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Clear previous query";
                };

                disable-desktop-filters = mkOption {
                  type = types.bool;
                  default = false;
                  description = "Disable desktop filters";
                };

                grab-mouse-pointer = mkOption {
                  type = types.bool;
                  default = false;
                  description = "Grab mouse pointer";
                };

                hotkey-show-app = mkOption {
                  type = types.str;
                  default = "<Primary>space";
                  description = "Hotkey to open launcher";
                };

                render-on-screen = mkOption {
                  type = types.str;
                  default = "mouse-pointer-monitor";
                  description = "Open app on screen";
                };

                show-indicator-icon = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Show app icon";
                };

                show-recent-apps = mkOption {
                  type = types.str;
                  default = "1";
                  description = "Show recent apps";
                };

                terminal-command = mkOption {
                  type = types.str;
                  default = "";
                  description = "Terminal command";
                };

                theme-name = mkOption {
                  type = types.str;
                  default = "dark";
                  description = "Theme";
                };
              };
            };

            default = {};
          };
        };
      };

      default = {};
    };
  };

  config = mkIf (config.ulauncher.enable) {
    home.packages = [
      pkgs.ulauncher
    ];

    home.file.".config/ulauncher/settings.json".text = "${builtins.toJSON config.ulauncher.settings}";
  };
}
