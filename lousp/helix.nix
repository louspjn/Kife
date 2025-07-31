{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "gruvbox_dark_soft";

      editor = {
        line-number = "relative";
        continue-comments = false;
        color-modes = true;
        completion-trigger-len = 1;

        lsp.enable = true;

        shell = ["nu" "-c"];

        statusline = {
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };
    };

    languages = {
      language-server = {
        rust-analyzer = {
          command = "rust-analyzer";
        };
        nil = {
          command = "nil";
        };

        clangd = {
          command = "clangd";
        };
      };

      languages = [
        {
          name = "rust";
          language-server = "rust-analyzer";
          formatter.command = "rustfmt";
        }
        {
          name = "nix";
          language-server = "nil";
          formatter.command = "alejandra";
        }
        {
          name = "c";
          language-server = "clangd";
        }
      ];
    };
  };
}
