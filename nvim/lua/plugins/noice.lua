return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
      },

      --  messages & notify are pretty annoying, will change these later!
      messages = {
        enabled = false,
      },

      notify = {
        enabled = false,
      },
    })
  end,
}
