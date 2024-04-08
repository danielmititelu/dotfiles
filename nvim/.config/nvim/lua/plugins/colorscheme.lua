return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    cond = vim.g.vscode,
    config = function()
        require("catppuccin").setup {
            color_overrides = {
                mocha = {
                    -- base = "#000000",
                    -- mantle = "#000000",
                    -- crust = "#000000",
                },
            }
        }
        vim.cmd([[colorscheme catppuccin-mocha]])
    end,
}
