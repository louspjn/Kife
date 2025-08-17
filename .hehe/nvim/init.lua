require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("config.plugins")

vim.cmd [[
  highlight! link SignColumn Normal
]]

vim.api.nvim_set_hl(0, "CursorLineNr", { link = "DiagnosticWarn", bold = true })

require("config.binds")
