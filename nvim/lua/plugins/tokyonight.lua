return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        style = "day",
        cache = false,
        on_colors = function(colors)
            colors.bg_float = None
        end
    },
    init = function()
        vim.cmd[[colorscheme tokyonight]]
    end
}
