return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = function()
        require('neo-tree').setup({
            popup_border_style = "rounded",
            window = {
                border = "none",
                width = 32,
                position = "right",
            },
            filesystem = {
                filtered_items = {
                    hide_gitignored = false,
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        })

        vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#979ebf" })
        -- vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {
            silent = true,
            desc = "Toggle File explorer (Neotree)"
        })
    end
}

