return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_instaled = {"lua", "haskell", "nix", "rust", "javascript", "typescript"},
      highlight = {
        enable = true
      }
    }
  }
}
