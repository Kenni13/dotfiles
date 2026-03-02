return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30,
        position = "right",
				-- position = "right",
			},
			filesystem = {
				follow_current_file = {
					enable = true,
				},
			},

			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,

			-- sorts directories first
			-- directories by name (A-Z)
			-- files by extensions
			-- extensions by name (A-Z)
			-- dotfiles last
			sort_function = function(a, b)
				-- directories first
				if a.type == b.type and a.type == "directory" then
					return a.path < b.path
				end

				if a.type == "directory" then
					return true
				elseif b.type == "directory" then
					return false
				end

				-- check for dotfiles
				local a_dot = a.path:match("^%.") ~= nil
				local b_dot = b.path:match("^%.") ~= nil

				if a_dot ~= b_dot then
					return not a_dot -- regular files first, dotfiles last
				end

				-- compare by extension
				local ext_pattern = "%.([^%.]+)$"
				local a_ext = string.match(a.path, ext_pattern) or ""
				local b_ext = string.match(b.path, ext_pattern) or ""

				if a_ext ~= b_ext then
					return a_ext < b_ext
				end

				-- finally, compare by name
				return a.path < b.path
			end,
		})

    vim.keymap.set("n", "<leader>e", ":Neotree toggle right<CR>", {
      noremap = true, silent = true
    });
	end,
}
