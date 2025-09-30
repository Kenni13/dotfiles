return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				-- file_browser = {
				-- 	hijack_netrw = true,
				-- 	hidden = true,
				-- 	grouped = true,
				-- },
			},
		})

		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")

		-- set keymaps
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", telescope.extensions.file_browser.file_browser, {})
	end,
}
