{ pkgs, ... }:
{
  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        recorder = "${pkgs.wf-recorder}/bin/wf-recorder";

        l = "ls **/*";
        cd = "z";

        cat = "${pkgs.bat}/bin/bat --theme-dark base16";

        gd = "git add";
        gc = "git commit -m ";
        gp = "git push";
        gb = "git branch";
        gck = "git checkout";

        nhs = "nh home switch";
        nos = "nh os switch";
        nosu = "nh os switch -u";

        matrix = "${pkgs.cmatrix}/bin/cmatrix -C green -m";
        pipes = "${pkgs.pipes}/bin/pipes";
        bonsai = "${pkgs.cbonsai}/bin/cbonsai -lip";
        cava = "${pkgs.cava}/bin/cava";
      };

      settings = {
        edit_mode = "vi";
        table.mode = "rounded";

        buffer_editor = "hx";
        show_banner = false;
      };

      extraConfig = "microfetch";
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;

      settings = {
        add_newline = false;
        scan_timeout = 10;

        format = "$directory$rust$git_branch$git_status\n$character";

        rust = {
          symbol = "";
          format = "via [$symbol $version]($style)";
          version_format = "v$raw";
          style = "bold red";
          detect_extensions = [ "rs" ];
          detect_files = [ "Cargo.toml" ];
        };

        git_branch = {
          symbol = "";
          style = "bold purple";
        };

        git_status.disabled = false;

        character = {
          success_symbol = "[➜](bold light_green)";
          error_symbol = "[✗](bold red)";
        };
      };
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    yazi = {
      enable = true;
      settings = {
        mgr = {
          linemode = "size";
          sort_by = "natural";
          mouse_events = [ ];
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
              run = "hx -- \"$@\"";
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
