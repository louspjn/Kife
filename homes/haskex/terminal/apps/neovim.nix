{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "macchiato";
          transparent = true;
        };

        dashboard.alpha = {
          enable = true;
          theme = "startify";
        };

        git = {
          gitsigns.enable = true;
        };

        utility = {
          oil-nvim.enable = true;
          ccc.enable = true;
          surround.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            mappings = {
              open = "<space>j";
            };

            setupOpts = {
              direction = "float";
            };
          };
        };

        ui = {
          borders.enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableTreesitter = true;
          enableLSP = true;
          enableFormat = true;

          nix = {
            enable = true;
            treesitter.enable = true;
          };

          haskell = {
            enable = true;
            treesitter.enable = true;
          };

          fsharp = {
            enable = true;
            treesitter.enable = true;
          };

          java = {
            enable = true;
            treesitter.enable = true;
          };

          clang = {
            enable = true;
            treesitter.enable = true;
          };

          python = {
            enable = true;
            treesitter.enable = true;
          };

          html = {
            enable = true;
            treesitter.enable = true;
          };

          css = {
            enable = true;
            treesitter.enable = true;
          };

          rust = {
            enable = true;
            treesitter.enable = true;
          };

          markdown = {
            enable = true;
            treesitter.enable = true;
            extensions.render-markdown-nvim = {
              enable = true;
            };
          };
        };

        filetree.neo-tree.enable = true;
        autopairs.nvim-autopairs.enable = true;

        ui.colorizer.enable = true;
        syntaxHighlighting = true;

        options = {
          autoindent = true;

          tabstop = 2;
          shiftwidth = 2;
        };

        keymaps = [
          {
            key = "<space>";
            mode = ["n"];
            action = ":";
            silent = false;
            desc = "Space keybind to run a neovim comand";
          }

          {
            key = "<space>je";
            mode = ["t"];
            action = "<C-\\><C-n>";
            silent = true;
            desc = "Leave Terminal";
          }

          {
            key = "<space>e";
            mode = ["n"];
            action = ":Neotree toggle float<CR>";
            silent = true;
            desc = "Open Neo-Tree";
          }

          {
            key = "<space><space>";
            mode = ["n"];
            action = ":Telescope find_files<CR>";
            silent = true;
            desc = "Open Telescope in find files mode";
          }

          {
            key = "<space>o";
            mode = ["n"];
            action = ":Telescope<CR>";
            silent = true;
            desc = "Open Telescope";
          }

          {
            key = "\\";
            mode = ["n"];
            action = ":nohlsearch<CR>";
            silent = true;
            desc = "Disable search Highlighting";
          }

          {
            key = "-";
            mode = ["n"];
            action = ":Oil<CR>";
            silent = true;
            desc = "Open Oil.nvim plugin";
          }

          {
            key = "<space>c";
            mode = ["n"];
            action = ":CccPick<CR>";
            silent = true;
            desc = "Open Ccc.nvim plugin";
          }

          {
            key = "<space>d";
            mode = ["n"];
            action = ":lua vim.diagnostic.open_float()<CR>";
            silent = true;
            desc = "Show code diagnostics";
          }

          {
            key = "df";
            mode = ["n"];
            action = ":lua vim.lsp.buf.definition()<CR>";
            silent = true;
            desc = "Go to definition";
          }
        ];
      };
    };
  };
}
