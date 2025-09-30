-- I hate having to type it twice
local LSPs = {
	"lua_ls",
	"clangd",
	"pyright",
	"jdtls",
}

-- so I can easily share it
-- local home = "/home/said"

return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"MysticalDevil/inlay-hints.nvim",
		},
		lazy = false,
		-- // mason installs the LSP servers
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = LSPs,
			})
		end,
	},
	{
		-- lspconfig with capabilities and on_attach
		"neovim/nvim-lspconfig",
		config = function()
			local inlay_hints = require("inlay-hints")
			local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = has_cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
				or vim.lsp.protocol.make_client_capabilities()
			local _ = require("lspconfig")

			local on_attach = function(client, bufnr)
				inlay_hints.on_attach(client, bufnr)

				local opts = { buffer = bufnr }
				-- // these keymaps will say here (because of obvious reasons)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end

			vim.diagnostic.config({
				virtual_text = { prefix = "■" },
		  signs = true,
		  underline = true,
		  update_in_insert = false,
		  severity_sort = true,
	  })

	  for _, srv in ipairs(LSPs) do
		  local ok, _ = pcall(function()
			  local config = {
				  capabilities = capabilities,
				  on_attach = on_attach,
			  }

			  if srv == "clangd" then
				  config.cmd = {
					  "clangd",
					  "--header-insertion=never", -- you already have this
					  "--completion-style=detailed", -- shows function signatures
					  "--limit-results=100", -- optional
					  "--all-scopes-completion=false", -- disable completions outside project
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
			  vim.notify("lspconfig: failed to setup " .. srv .. " reason: " .. _, vim.log.levels.WARN)
		  end
	  end
  end,  },
}
