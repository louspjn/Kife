local cmd = vim.cmd
local kmp = vim.keymap
local api = vim.api

kmp.set("n", "x", function()
  cmd("normal! V")
end, { noremap = true, silent = true })

kmp.set("v", "x", function()
  cmd("normal! j")
end, { noremap = true, silent = true })

kmp.set("n", "d", "x", { noremap = true })

kmp.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
kmp.set("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })

kmp.set("n", "<leader>r", ":source<CR>", { noremap = true, silent = true })
