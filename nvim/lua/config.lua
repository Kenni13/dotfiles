-- disable file explorer
vim.g.netrw_banner = 0

vim.opt.nu = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard:append("unnamedplus")

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3 -- one global status line

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.o.cmdheight = 0


vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    vim.schedule(function()
      vim.o.cmdheight = 0
    end)
  end
})
