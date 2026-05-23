local ensure_installed = {
  "lua_ls",
  "clangd",
  "pyright",

  -- rust_analyzer is handled by rustacianvim
}

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies ={
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    lazy = false,

    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        automatic_enable = false, -- to stop rust-analyzer from being enabled
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities();
      capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

      for _, srv in ipairs(ensure_installed) do
        local ok, _ = pcall(function()
          local config = {
            capabilities = capabilities,
          }

          if srv == "clangd" then
            config.cmd = {
              "clangd",
              --"--header-insertion=never",
              "--completion-style=detailed",
              "--all-scopes-completion=false",
            }
          elseif srv == "lua_ls" then
            config.settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              },
            }
          end

          vim.lsp.config(srv, config)
        end)
        if not ok then
          vim.notify("lspconfig: failed to setup " .. srv .. " reason: " .. _, vim.log.levels.ERROR)
        end;
      end;

      vim.lsp.enable(ensure_installed);
    end,
  }
}
