{ pkgs, lib, ... }: {
  files = {
    ".config/helix/config.toml" = {
      generator = (pkgs.formats.toml {}).generate "helixconfig";
      value = {
        theme = "catppuccin_mocha";

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
        theme = "Catppuccin Mocha";

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

    ".config/fastfetch/config.jsonc" = {
      generator = lib.generators.toJSON {};
      value = {     
        display = {
          color.keys = "blue";

          key = {
            type = "string";
            width = 6;
          };

          percent = {
            color = {
              green = "yellow";
              red = "yellow";
              yellow = "yellow";
            };

            type = 9;
          };
          separator = "  ";
        };

        logo = {
          padding = {
            left = 1;
            top = 1;
          };
          source = "/home/lousp/Kife/assets/imgs/Nix.txt";
          width = 6;
        };

        modules = [
          { text = "echo"; type = "custom"; }
          # { text = "echo"; type = "custom"; }
          { key = " "; type = "os"; }
          { key = " "; type = "shell"; }
          { key = " "; type = "wm"; }
          { key = " "; type = "memory"; }
          { key = "󱥎 "; type = "disk"; }
          { key = " "; text = "hyprctl splash"; type = "command"; }
          { key = " "; symbol = "circle"; type = "colors"; }
        ];
      };
    };
  };
}
