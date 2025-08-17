return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.completion").setup()
    require("mini.snippets").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
  end
}
