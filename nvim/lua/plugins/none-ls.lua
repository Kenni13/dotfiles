return {
	--// set up formatters (none-ls)
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"nvimtools/none-ls.nvim",
		"mason-org/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local null_ls = require("null-ls")

		mason_null_ls.setup({
			ensure_installed = { "stylua", "clang-format", "black", "isort" },
			automatic_installation = false,
		})

		local formatting = null_ls.builtins.formatting
		null_ls.setup({
			sources = {
				-- // lua
				formatting.stylua,

				-- // python
				formatting.black, -- // for formatting code
				formatting.isort, -- // for formatting imports

				-- // C/C++/Java/JavaScript/Json
				formatting.clang_format,
			},
		})
	end,
}
