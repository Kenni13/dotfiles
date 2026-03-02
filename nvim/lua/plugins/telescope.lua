return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		telescope.load_extension("ui-select")

		-- set keymaps
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files', silent=true, noremap=true })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep', silent=true, noremap=true })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers', silent=true, noremap=true })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags', silent=true, noremap=true })

	end,
}


