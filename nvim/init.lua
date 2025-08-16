vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set colorcolumn=100")

vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.keymappings")
require("config.lazy")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Ensure all folds are open by default
vim.opt.foldenable = true         -- enables folding (required)
vim.opt.foldlevel = 99            -- ensures folds are open
vim.opt.foldlevelstart = 99       -- sets starting fold level when opening file
