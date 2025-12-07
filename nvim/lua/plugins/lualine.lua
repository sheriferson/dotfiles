return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        require('lualine').setup({
            options = {
                theme = "tomorrow",
                component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},

            },
            sections = {
                lualine_a = { { 'mode', right_padding = 2 } },
                lualine_b = { 'filename', 'branch', 'diff' },
                lualine_c = {
                    'searchcount', 'buffers' --[[ add your center compoentnts here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        })
    end
}
