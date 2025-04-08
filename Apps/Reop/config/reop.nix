{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkOption mkIf types;
in {
  options = {
    reop = mkOption {
      type = types.submodule {
        options = {
          enable = mkOption {
            type = types.bool;
            default = false;
            description = "Enable Reop";
          };

          settings = mkOption {
            type = types.submodule {
              options = {
                editor = mkOption {
                  type = types.str;
                  default = "";
                  description = "Editor to open project";
                };

                shell = mkOption {
                  type = types.str;
                  default = "bash";
                  description = "Default Shell interpreter";
                };

                projects = mkOption {
                  type = types.attrsOf (types.submodule {
                    options = {
                      nixShell = mkOption {
                        type = types.submodule {
                          options = {
                            path = mkOption {
                              type = types.str;
                              default = "";
                              description = "Path for the Nix DevShell";
                            };

                            host = mkOption {
                              type = types.str;
                              default = "";
                              description = "Host or Configuration of Nix DevShell";
                            };
                          };
                        };

                        default = {};
                        description = "Nix DevShell";
                      };

                      path = mkOption {
                        type = types.str;
                        default = "";
                        description = "Path for the project";
                      };
                    };
                  });

                  default = {};
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

  config = mkIf (config.reop.enable) {
    home.packages = [
      (pkgs.callPackage ../default.nix {})
    ];

    home.file.".config/reop/config.json".text = "${builtins.toJSON config.reop.settings}";
  };
}
