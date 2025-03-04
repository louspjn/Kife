{ config, pkgs, ... }:

let
  nvim_config = ../../dotfiles/nvim
in 
{
  home.file = {
    ".config/nvim/init.lua".source = ${nvim_config}/init.lua;
  
    ".config/nvim/lua/config.lua".source = ${nvim_config}/lua/config.lua;

    ".config/nvim/lua/plugins/autopairs.lua".source = ${nvim_config}/lua/plugins/autopairs.lua;
  
    ".config/nvim/lua/plugins/completions.lua".source = ${nvim_config}/lua/plugins/completions.lua;

    ".config/nvim/lua/plugins/lsp-config.lua".source = ${nvim_config}/lua/plugins/lsp-config.lua;

    ".config/nvim/lua/plugins/lualine.lua".source = ${nvim_config}/lua/plugins/lualine.lua;

    ".config/nvim/lua/plugins/markdown-render.lua".source = ${nvim_config}/lua/plugins/markdown-render.lua;

    ".config/nvim/lua/plugins/neotree.lua".source = ${nvim_config}/lua/plugins/neotree.lua;

    ".config/nvim/lua/plugins/none-ls.lua".source = ${nvim_config}/nvim/lua/plugins/none-ls.lua;

    ".config/nvim/lua/plugins/nord.lua".source = ${nvim_config}/nvim/lua/plugins/nord.lua;

    ".config/nvim/lua/plugins/telescope.lua".source = ${nvim_config}/nvim/lua/plugins/telescope.lua;

    ".config/nvim/lua/plugins/treesitter.lua".source = ${nvim_config}/nvim/lua/plugins/treesitter.lua;
  };
}
