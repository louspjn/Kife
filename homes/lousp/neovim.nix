{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        theme = {
          enable = true;

          name = "gruvbox";
          style = "dark";
        };

        dashboard.alpha = {
          enable = true;
          theme = "startify";
        };

        git = {
          gitsigns.enable = true;
        };

        utility = {
          surround.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            mappings = {
              open = "<leader>h";
            };

            setupOpts = {
              direction = "horizontal";
            };
          };
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;

          nix.enable = true;
          rust.enable = true;
          ts.enable = true;
        };

        filetree.nvimTree = {
          enable = true;
        };

        autopairs.nvim-autopairs.enable = true;

        ui = {
          borders = {
            enable = true;
            globalStyle = "single";
          };
          colorizer.enable = true;
        };

        syntaxHighlighting = true;

        options = {
          autoindent = true;

          tabstop = 2;
          shiftwidth = 2;
        };

        keymaps = [
          {
            key = "<leader>";
            mode = ["n"];
            action = ":";
            silent = false;
            desc = "Space keybind to run a neovim comand";
          }

          {
            key = "<leader>je";
            mode = ["t"];
            action = "<C-\\><C-n>";
            silent = true;
            desc = "Leave Terminal";
          }

          {
            key = "<leader>e";
            mode = ["n"];
            action = ":NvimTreeToggle<CR>";
            silent = true;
            desc = "Open NvimTree";
          }

          {
            key = "<leader>ff";
            mode = ["n"];
            action = ":Telescope find_files<CR>";
            silent = true;
            desc = "Open Telescope in find files mode";
          }

          {
            key = "<leader>ft";
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
            key = "<leader>d";
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
