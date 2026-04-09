-- // Make Neovim fully transparent
local transparent_groups = {
  "Normal",
  "NormalNC",
  "VertSplit",
  "StatusLine",
  "StatusLineNC",
  "LineNr",
  "SignColumn",
  "CursorLineNr",
  "Folded",
  "Pmenu",
  "TabLine",
  "TabLineSel",
  "TabLineFill",
}

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end, 50)
  end,
})
