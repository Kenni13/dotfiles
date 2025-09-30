-- return {
--   "akinsho/bufferline.nvim",
--   version = "*",
--   dependencies = "nvim-tree/nvim-web-devicons",
--   config = function()
--     vim.opt.termguicolors = true
--
--     require("bufferline").setup({
--       options = {
--         numbers = function(opts)
--           return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
--         end,
--         diagnostics = "nvim_lsp",
--         diagnostics_indicator = function(_, _, diagnostics_dict, _)
--           local s = " "
--           for e, n in pairs(diagnostics_dict) do
--             local sym = e == "error" and " " or (e == "warning" and " " or " ")
--             s = s .. n .. sym
--           end
--           return s
--         end,
--         offsets = {
--           {
--             filetype = "neo-tree",
--             text = "FIle Explorer",
--             text_align = "center",
--             separator = true,
--           },
--         },
--       },
--     })
--
--     --local diagnostics_indicator = function(count, level, diagnostics_dict, context)
--     --  local icon = level:match("error") and " " or " "
--     --  return " " .. icon .. count
--     --end
--   end,
-- }
--[[
return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim", -- Optional, for persistent history
	},
	config = function()
		require("cokeline").setup({
			show_if_buffers_are_at_least = 2,

			sidebar = {
				filetype = { "neo-tree" },
				components = {
					{
						text = function(buf)
							return buf.filetype
						end,

						bold = true,
					},
				},
			},
		})
	end,
}]]

-- // I kinda don't like tabs so I'm gonna be disabling this until I need it
return {}
