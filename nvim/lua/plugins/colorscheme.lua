local yorumi = {
    "yorumicolors/yorumi.nvim",
    priority = 1000,
    config = function ()
        vim.cmd("colorscheme yorumi")

        -- Inlay hints fix
        vim.api.nvim_set_hl(0, "LspInlayHint", {
            fg = "#7d7d7d",
            bg = "#161616",
            italic = true,
            nocombine = true,
        })

        vim.api.nvim_set_hl(0, "IblWhitespace", {})
        vim.api.nvim_set_hl(0, "Visual", {bg = "#343742",})

        vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#2c2f3a" })

    end
}

return yorumi
