-- // set up the basics
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set clipboard+=unnamedplus")

vim.cmd([[set cindent]])
vim.cmd([[set cinoptions=:0,p0,t0]])

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
--   callback = function()
--     vim.lsp.codelens.refresh()
--   end,
-- })
