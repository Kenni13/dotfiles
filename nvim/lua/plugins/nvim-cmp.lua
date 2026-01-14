return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")
    local ok_ls, luasnip = pcall(require, "luasnip")

    -- lazy load vscode snippets
    if ok_ls then
      require("luasnip.loaders.from_vscode").lazy_load()
    end

    vim.o.completeopt = "menu,menuone,noselect"

    cmp.setup({
      snippet = {
        expand = function(args)

          if ok_ls then
            luasnip.lsp_expand(args.body)
          end

        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ok_ls and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ok_ls and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- <--- LSP first
        { name = "luasnip" }, -- snippets next
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    cmp.setup.cmdline("/", {
      mappings = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } }
    });


    cmp.setup.cmdline(":", {
      mappings = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      },{
        { name = "cmdline" }
      })
    });

  end,
}


