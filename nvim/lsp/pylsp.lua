---@type vim.lsp.Config
return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = {
    '.git',
    'Pipfile',
    'main.py',
    'pyproject.toml',
    'requirements.txt',
    'setup.cfg',
    'setup.py',
  },
  plugins = {
    pycodestyle = {
      ignore = {'W391'},
      maxLineLength = 100
    }
  }
}
