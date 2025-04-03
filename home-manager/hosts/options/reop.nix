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
              };
            };

            default = {};
          };
        };
      };

      default = {};
    };
  };

  config = mkIf (config.reop.enable) {

    home.file.".config/reop/config.json".text = "${builtins.toJSON config.reop.settings}";
  };
}
