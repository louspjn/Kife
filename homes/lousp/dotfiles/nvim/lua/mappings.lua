require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "lc", "ggdGi", { desc = "Delete all text in a file and enter in insert mode" })
map("n", "R", ":lua require(\"base46\").load_all_highlights()", { desc = "Reload neovim theme" })
