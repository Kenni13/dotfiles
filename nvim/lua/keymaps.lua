
local opts = {
	noremap = true,
	silent = true
};


-- // quit and save all buffers
vim.keymap.set("n", "<leader>qq", ":qall!<CR>", opts)

-- // for selecting even after indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- pasting doesn't overwrite clipboard (this was annoying)
vim.keymap.set("x", "p", '"_dP', opts)


-- Resize splits with Ctrl+Shift+Arrow
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- // splits
vim.keymap.set("n", "<leader>-", ":split<CR>", opts)
vim.keymap.set("n", "<leader>/", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>x", ":close<CR>", opts)



