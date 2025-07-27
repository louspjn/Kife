{
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        settings = {
          "browser.search.defaultenginename" = "google";
        };

        search = {
          force = true;
          default = "google";

          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "channel"; value = "unstable"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              definedAliases = ["@np"];
            };

            "My NixOS" = {
              urls = [{
                template = "https://mynixos.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];

              definedAliases = ["@mn"];
            };
          };
        };
      };
    };
  };
}
