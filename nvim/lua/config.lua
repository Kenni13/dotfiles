
-- // set up the basics
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.tabstop = 2 -- a tab counts as 2 spaces visually
vim.opt.softtabstop = 2 -- backspace/delete treats tab as 2 spaces
vim.opt.shiftwidth = 2 -- indentation width is 2 spaces
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function ()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})
