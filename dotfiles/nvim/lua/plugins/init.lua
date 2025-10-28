return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",

    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { "onsails/lspkind.nvim" },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}
