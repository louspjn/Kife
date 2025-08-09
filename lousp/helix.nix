{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "catppuccin_macchiato";

      editor = {
        line-number = "relative";
        continue-comments = false;
        color-modes = true;
        completion-trigger-len = 1;

        lsp.enable = true;

        shell = ["nu" "-c"];
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
