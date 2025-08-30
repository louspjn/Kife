{
  programs = {
    nushell.enable = true;

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    fastfetch = {
      enable = true;

      settings = {
        logo = {
          source = "~/Yalix/assets/imgs/Nix.png";
          width = 24;
          height = 10;
          padding.left = 1;
        };

        modules = [
          {
            type = "custom";
            text = "echo";
          }
          {
            type = "os";
            key = " ";
          }
          {
            type = "kernel";
            key = " ";
          }
          {
            type = "shell";
            key = " ";
          }
          {
            type = "wm";
            key = " ";
          }
          {
            type = "memory";
            key = " ";
          }
          {
            type = "disk";
            key = "󱥎 ";
          }
          {
            type = "command";
            key = " ";
            text = "hyprctl splash";
          }
          {
            type = "colors";
            key = " ";
            symbol = "circle";
          }
        ];

        display = {
          separator = "  ";
          color.keys = "blue";

          key = {
            width = 6;
            type = "string";
          };

          percent = {
            type = 9;
            color = {
              green = "yellow";
              yellow = "yellow";
              red = "yellow";
            };
          };
        };
      };
    };

    yazi = {
      enable = true;
      settings = {
        mgr = {
          linemode = "size";
          sort_by = "natural";
          mouse_events = [];
        };

        preview = {
          wrap = "yes";
          max_width = 3600;
          max_height = 3600;
        };

        input = {
          cursor_blink = true;
        };

        opener = {
          edit = [
            {
              run = "nvim -- \"$@\"";
              desc = "$EDITOR";
              block = true;
            }
          ];
        };
      };
    };

    zellij = {
      enable = true;
      settings = {
        status-bar = {
          enabled = true;
          position = "bottom";
          height = 1;
        };
      };
    };
  };
}
