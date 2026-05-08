local opts = {
	noremap = true,
	silent = true,
}

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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if vim.b.lsp_keymaps_set then
			return
		end

		vim.b.lsp_keymaps_set = true

		local bufnr = args.buf

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	end,
})
