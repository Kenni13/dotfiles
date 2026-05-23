vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, key, bind, opts)
	opts = opts or {}

	-- default silent & noremap to true
	opts.silent = opts.silent ~= false
	opts.noremap = opts.noremap ~= false

	vim.keymap.set(mode, key, bind, opts)
end

map("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
map("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting" })

map("v", "<", "<gv", { desc = "Unindent and keep selection" })
map("v", ">", ">gv", { desc = "Indent and keep selection" })

-- resize splits with Alt-Arrow
map("n", "<A-Down>", ":resize +2<CR>", { desc = "Resize split down" })
map("n", "<A-Up>", ":resize -2<CR>", { desc = "Resize split Up" })
map("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Resize split Left" })
map("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Resize split Right" })

map("n", "<leader>-", ":split<CR>")
map("n", "<leader>/", ":vsplit<CR>")
map("n", "<leader>x", ":close<CR>")

map("n", "n", "nzzzv", { desc = "Next search result with centered cursor" })
map("n", "N", "Nzzzv", { desc = "Previous search result with centered cursor" })

map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual select" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move lines up in visual select" })

map(
	"n",
	"<leader>crw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word on cursor", silent = false }
)
map("n", "<leader>re", "<cmd>restart<CR>", { desc = "Restart Neovim" })

map("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(_)
		map("n", "K", vim.lsp.buf.hover)
		map("n", "gD", vim.lsp.buf.declaration)
		map("n", "gd", vim.lsp.buf.definition)
		map("n", "<leader>ca", vim.lsp.buf.code_action)
		map("n", "<leader>rn", vim.lsp.buf.rename)
		map("n", "gr", vim.lsp.buf.references)
		map("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end)

		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end)

		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end)
	end,
})
