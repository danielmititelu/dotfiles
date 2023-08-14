return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.keymap.set('n', '<leader>fe', ':NvimTreeFindFileToggle<CR>')
        vim.keymap.set('n', '<leader>ft', ':NvimTreeToggle<CR>')
    end,
}
