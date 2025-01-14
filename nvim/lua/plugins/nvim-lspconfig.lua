return {
    "neovim/nvim-lspconfig",

    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.hls.setup{
            filetypes = { 'haskell', 'lhaskell', 'cabal' },
        }

        lspconfig.pylsp.setup{
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                          ignore = {'W391'},
                          maxLineLength = 100
                        }
                    }
                }
            }
        }
    end
}
