-- // Its actually none-ls (null-ls is deprecated)
return {
  --// set up formatters (none-ls)
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
    "mason-org/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    local null_ls = require("null-ls")

    mason_null_ls.setup({
      ensure_installed = { "stylua", "clang-format", "black", "isort" },
      automatic_installation = false,
    })

    null_ls.setup({
      sources = {
        -- // lua
        null_ls.builtins.formatting.stylua,

        -- // python
        null_ls.builtins.formatting.black, -- // for formatting
        null_ls.builtins.formatting.isort, -- // for imports. i(mport) sort

        -- // C/C++/Java/JavaScript/Json
        null_ls.builtins.formatting.clang_format,
      },
    })
  end,
}
