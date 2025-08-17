return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    require('gruvbox').setup({
        italics = {
            comments = true,
            keywords = true,
            functions = true,
            strings = true,
            variables = true,
        },
        bold = true,
        contrast = "soft",
    })
    vim.cmd("colorscheme gruvbox")
  end
}
