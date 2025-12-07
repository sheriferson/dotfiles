local map = vim.keymap.set

vim.g.mapleader = ","

map("n", ";", ":")
-- clear search with CR
map("n", "<CR>", ":noh<CR><CR>")

map("n", "j", "gj")
map("n", "k", "gk")

-- Iron.nvim
map('n', '<Bslash>s', '<cmd>IronRepl<cr>')
map('n', '<Bslash>rr', '<cmd>IronRestart<cr>')
map('n', '<space>', function()
    local last_line = vim.fn.line('$')
    local pos = vim.api.nvim_win_get_cursor(0)
    require('iron.core').send_line()
    vim.api.nvim_win_set_cursor(0, { math.min(pos[1] + 1, last_line), pos[2] })
end)

-- use system clipboard because you're not unhinged
map('v','<leader>y','"+y')

map("n", "<leader>vd", vim.diagnostic.open_float, opts)

-- sane exiting from terminal
map("t", "<Esc>", [[<C-\><C-n>]])

-- diagnostics with Telescope
map("n", "<C-s>", "<cmd>Telescope diagnostics<cr>")
-- fuzzy file finding with Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<C-g>", "<cmd>Telescope grep_string<cr>")

-- rename symbol
map('n', 'grn', vim.lsp.buf.rename)

-- Toggle NvimTree
map('n', '<Leader>t', ':NvimTreeToggle<CR>')
