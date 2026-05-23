vim.pack.add({
	{
		src = "https://github.com/nvim-mini/mini.nvim",
		version = "stable",
	},
})

require("mini.git").setup({})
require("mini.icons").setup({})
require("mini.starter").setup({})
require("mini.pairs").setup({})
require("mini.statusline").setup({})
require("mini.jump").setup({})
require("mini.indentscope").setup({})
require("mini.surround").setup({})
require("mini.diff").setup({
	view = {
		style = "sign",
	},

	source = require("mini.diff").gen_source.git(),
})

require("mini.files").setup({
	mappings = {
		go_in_plus = "<CR>",
		go_in = "<Right>",
		go_out = "<Left>",
	},

	options = {
		use_as_default = true,
	},
})

require("mini.cmdline").setup({
	autocorrect = { enable = false },
})

vim.keymap.set("n", "<leader>e", function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	if buf_name ~= "" and vim.bo.buftype == "" then
		require("mini.files").open(buf_name)
	else
		require("mini.files").open(vim.uv.cwd())
	end
end, { desc = "Toggle File Explorer" })

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

local mini_pick = require("mini.pick")
mini_pick.setup()

vim.keymap.set("n", "<leader>ff", function()
	mini_pick.builtin.files()
end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>fg", function()
	mini_pick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Mini Grep" })

local mini_extras = require("mini.extra")
mini_extras.setup()

vim.keymap.set("n", "<leader>xx", function()
	mini_extras.pickers.diagnostic()
end, { desc = "Mini Picker Diagnostic" })
vim.keymap.set("n", "<leader>pk", function()
	mini_extras.pickers.keymaps()
end, { desc = "Search Keymaps" })

require("mini.completion").setup({
	lsp_completion = {
		auto_setup = true,
	},
})

local mini_snips = require("mini.snippets")
mini_snips.setup({
	snippets = {
		mini_snips.gen_loader.from_lang(),
	},
})

mini_snips.start_lsp_server({ match = false })

require("mini.notify").setup({
  content = {
    lsp_progress = { enable = true, duration_last = 1000 },
  },

  window = {
    config = { border='double' },
    winblend = 15,
  }
})

vim.notify = require('mini.notify').make_notify()

