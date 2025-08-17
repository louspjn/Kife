local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.cursorlineopt = "number"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.clipboard = "unnamedplus"
opt.guicursor = ""

opt.fillchars = {
  eob = " "
}

opt.signcolumn = "yes"
opt.numberwidth = 1

opt.showmode = false

g.mapleader = " "
