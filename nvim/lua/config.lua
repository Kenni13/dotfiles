-- set up basics
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set clipboard+=unnamedplus")

--vim.opt.wrap = false

-- // folding
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"
--vim.o.foldlevel = 99

-- // set up leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- // complete options
vim.opt.completeopt = { "menuone", "noselect", "popup" }
