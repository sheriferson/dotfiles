return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    dependencies = {
      'epheien/outline-treesitter-provider.nvim'
    },
    opts = {
    symbol_folding = {
        -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
        autofold_depth = false,
        -- When to auto unfold nodes
        auto_unfold = {
            -- Auto unfold currently hovered symbol
            hovered = true,
            -- Auto fold when the root level only has this many nodes.
            -- Set true for 1 node, false for 0.
            only = true,
        },
        markers = { '', '' },
    },
        providers = {
            priority = { 'treesitter', 'lsp' }
        }
    }
}
