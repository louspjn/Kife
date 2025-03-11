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

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

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
