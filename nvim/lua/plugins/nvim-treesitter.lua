return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c",
                                     "bash",
                                     "elixir",
                                     "heex",
                                     "html",
                                     "javascript",
                                     "lua",
                                     "python",
                                     "query",
                                     "regex",
                                     "vim",
                                     "vimdoc",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = { "c", "rust", "latex", "tex" },
                },
                indent = {
                    enable = true
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
}
