-- // these themes are for yatline
local tokyo_night_theme = require("yatline-tokyo-night"):setup("night") -- or moon/storm/day
local gruvbox_theme     = require("yatline-gruvbox"):setup("dark") -- or "light" (yikes)
local rose_pine_theme   = require("yatline-rose-pine"):setup("moon")

-- includes
local zoxide       = require("zoxide")
local yatline      = require("yatline")
local full_boarder = require("full-border")
local git          = require("git")


-- setups
full_boarder:setup()
git:setup()

zoxide:setup({
	update_db = true,
})


yatline:setup({
	show_background = true,
  theme = rose_pine_theme,
	-- theme = gruvbox_theme,

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "coloreds", custom = true, name = { { " 󰇥 ", "#3c3836" } } },
			},
			section_b = {},
			section_c = {
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
	},

	status_line = {
		left = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},
})
