{pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        recorder = "${pkgs.wf-recorder}/bin/wf-recorder";
        print = "${pkgs.grim}/bin/grim -g (${pkgs.slurp}/bin/slurp)";

        l = "ls **/*";
        cd = "z";

        cat = "${pkgs.bat}/bin/bat";

        gd = "git add";
        gc = "git commit -m ";
        gp = "git push";
        gb = "git branch";
        gck = "git checkout";

        nhs = "nh home switch";
        nos = "nh os switch";

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

      extraConfig = "microfetch; use /nix/store/168d696s1j21ik2g2ak0x7mni0qz6ldp-starship-nushell-config.nu";
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
              run = "hx -- \"$@\"";
              desc = "$EDITOR";
              block = true;
            }
          ];
        };
      };
    };

    tmux = {
      enable = true;

      plugins = [
        pkgs.tmuxPlugins.gruvbox
      ];

      prefix = "C-s";
      keyMode = "vi";

      extraConfig = ''
        # Pane keybindings
        bind | split-window -h
        bind - split-window -v

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind c new-window
        bind w choose-window

        # Status bar
        set -g status-position bottom
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g @tmux-gruvbox 'dark'
      '';
    };

    fzf.enable = true;
  };
}
