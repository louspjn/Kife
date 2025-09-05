require("nvchad.configs.lspconfig").defaults()

local servers = { 'ts_ls', 'nil_ls', 'rust_analyzer', 'hls', 'qmlls', 'zls' }

vim.lsp.enable(servers)

vim.lsp.config['qmlls'] = {
  cmd = { 'qmlls', '-E' }
}

vim.lsp.config['hls'] = {
  cmd = { 'haskell-language-server', '--lsp' }
}

vim.lsp.config['zls'] = {
  cmd = { 'zls' }
}
