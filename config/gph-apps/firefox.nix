{
  programs.firefox = {
    enable = true;

    profiles.jhuan = {
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Youtube";
            tags = ["tube" "youtube" "videos"];
            keyword = "youtube";
            url = "https://youtube.com";
          }

          {
            name = "GitHub";
            tags = ["code" "coding" "projects" "repos"];
            keyword = "git";
            url = "https://github.com";
          }
        ];
      };

      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
                {
                  name = "channel";
                  value = "unstable";
                }
              ];
            }
          ];

          definedAliases = ["@nixpkgs" "@npkgs" "@np"];
        };
      };

      search.force = true;
    };
  };
}
