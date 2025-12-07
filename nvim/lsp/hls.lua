vim.lsp.config('hls', {
   filetypes = { 'haskell', 'lhaskell', 'cabal' },
 })


---@type vim.lsp.Config
return {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell', 'lhaskell' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern('hie.yaml', 'stack.yaml', 'cabal.project', '*.cabal', 'package.yaml')(fname))
  end,
  settings = {
    haskell = {
      formattingProvider = 'ormolu',
      cabalFormattingProvider = 'cabalfmt',
    },
  },
}
