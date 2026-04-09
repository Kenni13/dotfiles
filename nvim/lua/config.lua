
-- // set up the basics
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.tabstop = 2 -- a tab counts as 2 spaces visually
vim.opt.softtabstop = 2 -- backspace/delete treats tab as 2 spaces
vim.opt.shiftwidth = 2 -- indentation width is 2 spaces
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'

-- Enable filetype plugins and indentation
vim.cmd([[filetype plugin indent on]])

-- Enable C-style indentation
vim.cmd([[set cindent]])
-- Optional: tweak cindent rules
vim.cmd([[set cinoptions=:0,p0,t0]])

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   callback = function ()
--     vim.opt_local.shiftwidth = 2
--     vim.opt_local.softtabstop = 2
--   end
-- })

-- vim.api.nvim_create_autocmd({"BufEnter", "CursorHold", "InsertLeave"}, {
--   callback = function (_)
--     vim.lsp.codelens.refresh()
--   end
-- });
