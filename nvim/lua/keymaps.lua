local opts = { noremap = true, silent = true }

-- // for selecting even after indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- // quit and save all buffers
vim.keymap.set("n", "<leader>qq", ":qall!<CR>", opts)

-- // todo
vim.keymap.set("n", "<leader>fd", ":TodoTelescope<cr>", opts)

-- // formatting
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)

--// terminal mapping
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", opts)

-- // Neotree (filesystem)
vim.keymap.set("n", "<leader>e", ":Neotree toggle left<CR>", opts)

-- Resize splits with Ctrl+Shift+Arrow
-- FIX: Fix this shit!
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", {})
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", {})
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- pasting doesn't overwrite clipboard (this was annoying)
vim.keymap.set("x", "p", '"_dP', opts)

-- code snap (kinda broken ngl)
-- vim.keymap.set("v", "<leader>ss", ":CodeSnap<CR>", opts)

-- // splits
vim.keymap.set("n", "<leader>-", ":split<CR>", opts)
vim.keymap.set("n", "<leader>/", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>x", ":close<CR>", opts)
