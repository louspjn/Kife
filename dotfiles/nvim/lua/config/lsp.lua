local servers = { 'ts_ls', 'nil_ls', 'rust_analyzer', 'lua_ls', 'zls' }

vim.lsp.enable(servers)

vim.lsp.config['zls'] = {
  cmd = { 'zls' }
}
