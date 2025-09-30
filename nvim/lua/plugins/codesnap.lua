return {
	"mistricky/codesnap.nvim",
	build = "make",
  config = function ()
    require("codesnap").setup({
      has_breadcrumbs = true,
      show_workspace = true,
      bg_color = "#535c68",
      has_line_numbers = true,
      title = "CodeSnap",
      watermark = "Kenni Snap"
    })
  end
}
