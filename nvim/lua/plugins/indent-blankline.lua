return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  main = "ibl", -- new module name
  --opts = {
  --  indent = { char = "│" }, -- the character for indent guides
  --  scope = { enabled = true }, -- highlight current scope
  --},

  config = function()
    require("ibl").setup({
      scope = { enabled = true },
    })
  end,
}
