vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            on_attach = function(bufnr)
                local api = require "nvim-tree.api"
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
                vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open vertical'))
                vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close directory'))
            end
        }
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
    end,
}
