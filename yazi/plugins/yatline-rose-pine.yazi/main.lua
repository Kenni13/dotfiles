--==================--
-- Rose Pine Theme --
--==================--

-- TODO: implement palette
local base_palette = {}

-- TODO: implement palette
local moon_palette = {
	bg   = "#232136",
	bg0  = "#2a273f",
	bg1  = "#393552",
	fg   = "#e0def4",
	fg0  = "#908caa",
	red  = "#eb6f92",
	green= "#3e8fb0",
	yellow="#f6c177",
	blue = "#9ccfd8",
	magenta="#c4a7e7",
}

local dawn_palette = {
	bg = "#fffaf3",
	-- bg0 = "#ffeacc",
	-- bg1 = "#ffca80",
	-- bg0 = "#faf4ed",
	bg0 = "#f2e9e1",
	bg1 = "#dfdad9",
	-- background = "#d7827e",
	fg = "#575279",
	fg0 = "#797593",
	-- foreground = "#9893a5",
	-- cursor = "#cecacd",
	red = "#b4637a",
	green = "#286983",
	yellow = "#ea9d34",
	blue = "#56949f",
	magenta = "#907aa9",
}

--- Gets the Rose Pine theme.
--- @param flavor string Flavor of the theme: "dawn".
--- @return table theme Used in Yatline.
local function rose_pine_theme(flavor)
	local palettes = {
		-- base = base_palette,
		moon = moon_palette,
		dawn = dawn_palette,
	}

	local palette = palettes[flavor] or dawn_palette

	return {
		-- yatline
		section_separator_open = "",
		section_separator_close = "",

		inverse_separator_open = "",
		inverse_separator_close = "",

		part_separator_open = "",
		part_separator_close = "",

		style_a = {
			fg = palette.bg,
			bg_mode = {
				normal = palette.blue,
				select = palette.yellow,
				un_set = palette.red,
			},
		},
		style_b = { bg = palette.bg1, fg = palette.fg },
		style_c = { bg = palette.bg0, fg = palette.fg },

		permissions_t_fg = palette.blue,
		permissions_r_fg = palette.yellow,
		permissions_w_fg = palette.red,
		permissions_x_fg = palette.green,
		permissions_s_fg = palette.fg,

		selected = { icon = "󰻭", fg = palette.yellow },
		copied = { icon = "", fg = palette.green },
		cut = { icon = "", fg = palette.red },

		total = { icon = "", fg = palette.yellow },
		succ = { icon = "", fg = palette.green },
		fail = { icon = "", fg = palette.red },
		found = { icon = "", fg = palette.blue },
		processed = { icon = "", fg = palette.green },

		-- yatline-githead
		-- prefix_color = palette.subtext0,
		-- branch_color = palette.sapphire,
		-- commit_color = palette.mauve,
		-- behind_color = palette.flamingo,
		-- ahead_color = palette.lavender,
		-- stashes_color = palette.pink,
		-- state_color = palette.maroon,
		-- staged_color = palette.yellow,
		-- unstaged_color = palette.peach,
		-- untracked_color = palette.teal,
	}
end

return {
	setup = function(_, args)
		args = args or "dawn"

		return rose_pine_theme(args)
	end,
}
