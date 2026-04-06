return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},

	config = function()
		local todo = require("todo-comments")
		todo.setup()

		vim.keymap.set("n", "]t", function()
			todo.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			todo.jump_prev()
		end, { desc = "Previous todo comment" })

    vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { silent=true, noremap=true })
    -- TODO: Ermm this explain
    -- INFO: Some information
    -- FIXME: Bug here
    -- WARNING: Does this initialize properly?
    -- HACK: Shouldn't be hacking here
    -- PERF: fully optimized
    --
	end,
}
