{ config, pkgs, ... }:

{
  home.file = {
    ".config/nvim/init.lua".source = ../../dotfiles/nvim/init.lua;
  
    ".config/nvim/lua/config.lua".source = ../../dotfiles/nvim/lua/config.lua;

    ".config/nvim/lua/plugins/autopairs.lua".source = ../../dotfiles/nvim/lua/plugins/autopairs.lua;
  
    ".config/nvim/lua/plugins/completions.lua".source = ../../dotfiles/nvim/lua/plugins/completions.lua;

    ".config/nvim/lua/plugins/lsp-config.lua".source = ../../dotfiles/nvim/lua/plugins/lsp-config.lua;

    ".config/nvim/lua/plugins/lualine.lua".source = ../../dotfiles/nvim/lua/plugins/lualine.lua;

    ".config/nvim/lua/plugins/markdown-render.lua".source = ../../dotfiles/nvim/lua/plugins/markdown-render.lua;

    ".config/nvim/lua/plugins/neotree.lua".source = ../../dotfiles/nvim/lua/plugins/neotree.lua;

    ".config/nvim/lua/plugins/none-ls.lua".source = ../../dotfiles/nvim/lua/plugins/none-ls.lua;

    ".config/nvim/lua/plugins/nord.lua".source = ../../dotfiles/nvim/lua/plugins/nord.lua;

    ".config/nvim/lua/plugins/telescope.lua".source = ../../dotfiles/nvim/lua/plugins/telescope.lua;

    ".config/nvim/lua/plugins/treesitter.lua".source = ../../dotfiles/nvim/lua/plugins/treesitter.lua;
  };
}
