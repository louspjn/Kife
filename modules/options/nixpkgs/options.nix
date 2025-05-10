{lib, ...}: let
  inherit (lib) mkOption types mkEnableOption;
in {
  options.np = mkOption {
    type = types.submodule {
      options = {
        defaultPackages = mkEnableOption {
          description = "Install default lib packages";
          default = false;
        };

        unfree = mkEnableOption {
          description = "Allow Unfree packages";
          default = true;
        };

        packages = mkOption {
          type = types.listOf types.package;
          description = "A list of packages";
          default = [];
        };

        overlays = mkOption {
          type = types.submodule {
            options = {
              enable = mkEnableOption {
                description = "Use overlays on nixos configuration";
                default = false;
              };

              paths = mkOption {
                type = types.listOf types.path;
                default = [];
                description = "Overlays paths";
              };
            };
          };
        };
      };
    };
  };
}
