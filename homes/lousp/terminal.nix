{pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;

      shellAliases = let
        wf-recorder = "${pkgs.wf-recorder}/bin/wf-recorder";
        eza = "${pkgs.eza}/bin/eza";
        bat = "${pkgs.bat}/bin/bat";
        cmatrix = "${pkgs.cmatrix}/bin/cmatrix";
        pipes = "${pkgs.pipes}/bin/pipes";
        cbonsai = "${pkgs.cbonsai}/bin/cbonsai";
        cava = "${pkgs.cava}/bin/cava";
      in {
        recorder = wf-recorder;

        cd = "z";
        ls = "${eza} --icons --git";
        l = " ${eza} --tree --icons --git";

        cat = "${bat} --theme-dark base16";

        gd = "git add";
        gp = "git push";
        gm = "git merge";
        gb = "git branch";
        gs = "git status";
        gck = "git checkout";
        gc = "git commit -m ";

        nos = "nh os switch";
        nhs = "nh home switch";
        nosu = "nh os switch -u";

        matrix = "${cmatrix} -C green -m";
        pipes = pipes;
        bonsai = "${cbonsai} -lip";
        cava = cava;
      };

      settings = {
        edit_mode = "vi";
        table.mode = "rounded";

        buffer_editor = "nvim";
        show_banner = false;
      };

      extraConfig = "fastfetch";
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    fastfetch = {
      enable = true;

      settings = {
        logo = {
          source = "~/Alix/assets/imgs/Nix.png";
          # width = 22;
          width = 30;
          height = 10;
          # height = 10;
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
