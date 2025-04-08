{
  reop = {
    enable = true;
    settings = {
      editor = "nix run github:Jhuan-Nycolas/Nvim";
      shell = "fish";
      projects = {
        Option = {
          path = "~/Option/";
        };

        Web = {
          nixShell = {
            path = "~/Dev/";
            host = "yarn";
          };

          path = "~/Dev/web";
        };

        Cpp = {
          path = "~/Dev/Cpp";
        };

        Python = {
          path = "~/Dev/Python/";
        };

        Reop = {
          path = "~/Reop/";
        };
      };
    };
  };
}
