return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        vim.opt.showmode = false
        require('lualine').setup {
            options = {
                theme = "catppuccin"
            },
        }
    end
}
