require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<space>", ":", { desc = "CMD enter command mode" })
map("n", "lc", "ggdGi", { desc = "Delete all text in a file and enter in insert mode" })
map("n", "R", ":lua require(\"base46\").load_all_highlights()<CR>", { desc = "Reload neovim theme" })
