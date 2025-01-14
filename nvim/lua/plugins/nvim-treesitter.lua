return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
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
