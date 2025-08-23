require("nvchad.configs.lspconfig").defaults()

vim.lsp.enable('ts_ls')
vim.lsp.enable('nil_ls')
vim.lsp.enable('rust_analyzer')

-- read :h vim.lsp.config for changing options of lsp servers 
