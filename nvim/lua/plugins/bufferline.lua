return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        config = function ()
            vim.opt.termguicolors = true
            require("bufferline").setup({
                options = {
                    offsets = {
                        {
                            -- filetype = "NvimTree",           -- Filetype of the sidebar window
                            filetype = "neo-tree",           -- Filetype of the sidebar window
                            text = "File Explorer",          -- Text to show in the offset area
                            highlight = "Directory",         -- Highlight group for the text
                            separator = true,                -- Draw a separator (line)
                            text_align = "center"              -- Optional: "left" | "center" | "right"
                        }
                    },
                    -- mode = "tabs",
                },
            })

            local keymap =  vim.keymap

            keymap.set('n', "<leader>b]", "<cmd>BufferLineCycleNext<CR>", {
                silent = true,
                desc = "Cycle to next Buffer",
            })

            keymap.set('n', "<leader>b[", "<cmd>BufferLineCyclePrev<CR>", {
                silent = true,
                desc = "Cycle to next Buffer",
            })


        end,
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
}
