local LSPs = {
	"lua_ls",
	"clangd",
	"pyright",
}

return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		lazy = false,
		-- // mason installs the LSP servers
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = LSPs,
        automatic_enable = false,
			})
		end,
	},
	{
		-- lspconfig with capabilities and on_attach
		"neovim/nvim-lspconfig",
		config = function()
			local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = has_cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
				or vim.lsp.protocol.make_client_capabilities()

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
					}

					if srv == "clangd" then
						config.cmd = {
							"clangd",
              "--clang-tidy",
							"--header-insertion=never", -- no header
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
          vim.lsp.enable(srv)
				end)

				if not ok then
					vim.notify("lspconfig: failed to setup " .. srv .. " reason: " .. _, vim.log.levels.ERROR)
				end
			end
		end,
	},
}
