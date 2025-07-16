vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.keymappings")
require("config.lazy")

