return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",  -- legacy branch
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "lua", "python", "rust" },
      sync_install = false,
      auto_install = false,

      indent = {
        enable = false,
      },

      ignore_install = {},

      highlight = {
        enable = true,
        -- disable for files >100KB
        disable = function(_, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,
      },
    })
  end,
}
