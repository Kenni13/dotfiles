return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- TODO: uhm there's a block before lualina. pretty sure that's what lua line is for lol
	config = function()
		require("lualine").setup()
	end,
}
