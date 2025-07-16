return {
    {
        'windwp/nvim-autopairs',
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function ()
            require("nvim-autopairs").setup({
                check_ts = true,
                disable_filetype = { "TelescopePrompt", "vim", "terminal" },
                fast_wrap = {
                    map = "<M-e>",
                    chars = { "{", "[", "(", '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = "$",
                    keys = "qwertyuiopzxcvbnmasdfghjkl",
                    check_comma = true,
                    highlight = "Search",
                    highlight_grey = "Comment",
                },
            })

            -- inside your nvim-cmp config
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {}
    },
    -- Pluging to comments
    {
        "tpope/vim-commentary",
        event = { "BufReadPre", "BufNewFile" },
    },
    -- rainbow bracket pairs
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function ()
            require ('rainbow-delimiters.setup').setup {
                strategy = {
                    [''] = 'rainbow-delimiters.strategy.global',
                    commonlisp = 'rainbow-delimiters.strategy.local',
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    latex = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterCyan',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterRed',
                },
                blacklist = {'c', 'cpp'},
            }


        end
    },

}

