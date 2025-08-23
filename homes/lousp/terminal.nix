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

      extraConfig = "microfetch";
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;

      settings = {
        add_newline = false;
        scan_timeout = 10;

        format = "$directory$rust $git_branch$git_status\n$character";

        rust = {
          symbol = "";
          format = "via [$symbol $version]($style)";
          version_format = "v$raw";
          style = "bold red";
          detect_extensions = ["rs"];
          detect_files = ["Cargo.toml"];
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
