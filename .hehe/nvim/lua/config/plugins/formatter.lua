return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup {
      filetype = {
        nix = {
          function() return {
            exe "alejandra", stdin = true
          } end
        }
      }
    }
  end
}
