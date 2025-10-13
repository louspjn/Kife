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

    ".config/starship.toml" = {
      generator = (pkgs.formats.toml {}).generate "starshipconfig";
      value = {
        palette = "colors";
        palettes.colors = {
          color1 = "#3C3836";
          color2 = "#EA6962";
          color3 = "#A9B665";
          color4 = "#D8A657";
          color5 = "#7DAEA3";
          color6 = "#D3869B";
          color7 = "#89B482";
          color8 = "#D4BE98";
          color9 = "#3C3836";
        };

        format = "$directory$nix_shell$rust$lua$haskell$nodejs$git_branch$git_status\n$character";

        character = {
          error_symbol = "[λ](bold red)";
          success_symbol = "[λ](bold color4)";
        };

        git_branch = {
          style = "bold red";
          symbol = "";
        };

        git_status.disabled = false;

        lua.format = "via [󰢱 $version](bold blue) ";

        nix_shell = {
          disabled = false;
          format = "via [ $name](bold blue) ";
          impure_msg = "";
          pure_msg = "";
          unknown_msg = "";
        };

        rust = {
          detect_extensions = ["rs"];
          detect_files = ["Cargo.toml"];
          format = "via [ $version](bold orange) ";
          version_format = "v$raw";
        };
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
          { text = "echo"; type = "custom"; }
          { key = " "; type = "os"; }
          { key = " "; type = "shell"; }
          { key = " "; type = "wm"; }
          { key = " "; type = "memory"; }
          { key = "󱥎 "; type = "disk"; }
          { key = " "; symbol = "circle"; type = "colors"; }
        ];
      };
    };
  };
}
