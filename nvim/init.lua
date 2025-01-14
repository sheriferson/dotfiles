require("options")
require("maps")
require("config.lazy")

-- Restore cursor position
-- https://stackoverflow.com/a/72939989
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 's',
    function()
        hop.hint_words({ direction = directions.AFTER_CURSOR })
    end,
    {remap=true}
)
vim.keymap.set('', 'b',
    function()
        hop.hint_words({ direction = directions.BEFORE_CURSOR })
    end,
    {remap=true}
)
