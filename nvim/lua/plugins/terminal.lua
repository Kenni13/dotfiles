return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			close_on_exit = true,
			on_scroll = true,
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
			},
		})
	end,
}
