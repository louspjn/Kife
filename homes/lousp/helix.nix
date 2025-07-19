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

        haskell = {
          command = "haskell-language-server";
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
          formatter = {
            command = "alejandra";
          };
        }
        {
          name = "c";
          language-server = "clangd";
        }
        {
          name = "haskell";
          language-server = "haskell";
        }
      ];
    };
  };
}
