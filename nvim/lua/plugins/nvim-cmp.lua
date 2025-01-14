return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        'hrsh7th/vim-vsnip',
        'onsails/lspkind-nvim', -- for icons in autocomplete lists
    },

    config = function()
        local cmp = require("cmp")
        local lspkind = require('lspkind')

        cmp.setup.filetype("markdown", { enabled = false})
        cmp.setup.filetype("txt", { enabled = false})

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                   mode = 'symbol', -- show only symbol annotations
                   maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                      -- can also be a function to dynamically calculate max width such as
                      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                   ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                   show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                })
            },
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
            }, {
                { name = 'buffer' },
            })

        })
    end
}
