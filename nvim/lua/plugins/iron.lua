return {
    "Vigemus/iron.nvim",
    init = function()
        local iron = require("iron.core")
        local view = require("iron.view")
        iron.setup({
            keys = {
                {"<Bslash>s", "<cmd>IronRepl<cr>", desc="Start Iron Repl"},
            },
            config = {
                scratch_repl = true,
                repl_definition = {
                    python = require("iron.fts.python").ipython
                },
            -- How the repl window will be displayed
            -- See below for more information
            repl_open_cmd = require("iron.view").split.horizontal.botright(0.4)
            },
            keymaps = {
                visual_send = "<leader>v",
                send_file = "<leader>sf",
                send_line = "<leader>sl",
                send_until_cursor = "<leader>su",
                exit = "<leader>sq",
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true,
        })
    end,
}
