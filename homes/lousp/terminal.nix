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
