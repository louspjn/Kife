{
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        settings = {
          "browser.startup.homepage" = "https://google.com";
          "browser.search.defaultenginename" = "Google";
        };

        search = {
          force = true;
          default = "Google";

          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              definedAliases = ["@np"];
            };

            "My NixOS" = {
              urls = [{
                template = "https://mynixos.com/search";
                params = [
                  { name = "q"; value = "{search}"; }
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
