return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        view = {
            width = 50
        },
        sort = {
          sorter = "case_sensitive",
        },
        filters = {
            dotfiles = true,
        },
    }
  end,
}
