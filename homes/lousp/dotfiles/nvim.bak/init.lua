vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--depth 1", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"ellisonleao/gruvbox.nvim"},
  require("plugins.treesitter")
})

vim.cmd[[
  colorscheme gruvbox
]]
