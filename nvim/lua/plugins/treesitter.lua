return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "cpp", "python", "java" },
      sync_install = false,
      auto_install = false,

      indent = {
        enable = true,
      },
      -- // list of parsers to ignore install (or "all")
      ignore_install = {},

      highligh = {
        enable = true,

        -- // disable for files greater than 100KB
        disable = function(_, buf)
          -- // It'd get messy if treesitter tried parsing a 100KB file
          local max_filesize = 100 * 1024 -- // 100KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.vim_buf_get_name(buf))

          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    })
  end,
}
