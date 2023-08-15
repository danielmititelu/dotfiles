return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            auto_close = true
        }
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
    end,
}
