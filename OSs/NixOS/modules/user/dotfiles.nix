{ pkgs, lib, ... }: {
  files = {
    ".config/helix/config.toml" = {
      generator = (pkgs.formats.toml {}).generate "helixconfig";
      value = {
        theme = "gruvbox-material";

        editor = {
          line-number = "relative";
          continue-comments = false;
          color-modes = true;
          completion-trigger-len = 1;
          auto-format = true;
          shell = [ "nu" "-c" ];

          lsp.enable = true;
        };
      };
    };

    ".config/ghostty/config" = {
      generator = lib.generators.toKeyValue {};
      value = {
        theme = "Gruvbox Dark";

        window-padding-x = 12;
        window-padding-y = 15;

        window-inherit-working-directory = false;
        window-decoration = "none";
      };
    };

    ".config/git/config" = {
      generator = (pkgs.formats.gitIni {}).generate "gitconfig";
      value = {
        user = {
          name = "louspjn";
          email = "nycojn@gmail.com";
        };

        credential.helper = "store";
        init.defaultBranch = "main";
      };
    };
  };
}
