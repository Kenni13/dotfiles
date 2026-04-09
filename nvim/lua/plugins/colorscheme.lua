-- Themes are put here with a name. That way they can be loaded AND be used with themery
local themes = {
	{ "catppuccin/nvim", name = "catppuccin-frappe" },
	{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },
	{ "sainnhe/gruvbox-material", name = "gruvbox-material" },
	{ "shaunsingh/nord.nvim", name = "nord" },
	{ "rose-pine/neovim", name = "rose-pine" },
}

local function themes_names()
	local names = {}
	for _, theme in pairs(themes) do
		table.insert(names, theme.name)
	end

	return names
end

return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = themes_names(),
				livePreview = true, -- Apply theme while picking. Default to true.
				-- globalAfter = code
			})

			vim.keymap.set("n", "<leader>cs", ":Themery<CR>")
		end,
	},

	unpack(themes),
}
