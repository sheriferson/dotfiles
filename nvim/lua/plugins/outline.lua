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
        providers = {
            priority = { 'treesitter', 'lsp' }
        }
    }
}
