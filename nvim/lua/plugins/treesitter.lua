return   {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()

        -- setup nvim-treesitter
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "rust", 'toml' },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
