{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };

    dashboard.alpha = {
      enable = true;

      theme = "startify";
    };

    ui.borders.enable = true;

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    
    assistant.copilot = {
      enable = true;

      cmp.enable = true;

      mappings.panel.open = "<C-c>";
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.treesitter.enable = true;
      html.treesitter.enable = true;
      clang.treesitter.enable = true;
      css.treesitter.enable = true;
      java.treesitter.enable = true;
      ts.treesitter.enable = true;

      nix.enable = true;
      html.enable = true;
      clang.enable = true;
      css.enable = true;
      java.enable = true;
      ts.enable = true;
    };

    filetree.neo-tree.enable = true; 
    autopairs.nvim-autopairs.enable = true;

    ui.colorizer.enable = true;
    syntaxHighlighting = true;

    options = {
      autoindent = true;

      tabstop = 2;
      shiftwidth = 2;

      cursorline = true;
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
        key = ";";
        mode = ["n"];
        action = ":Neotree toggle<CR>";
        silent = true;
        desc = "Open Neo-Tree";
      }

      {
        key = "<space><space>";
        mode = ["n"];
        action = ":Telescope find_files<CR>";
        silent = true;
        desc = "Open Telescope";
      }
    ];
  };
}
