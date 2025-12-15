return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- Source: LSP
      "hrsh7th/cmp-buffer",       -- Source: buffer
      "hrsh7th/cmp-path",         -- Source: chemins de fichiers
      "L3MON4D3/LuaSnip",         -- Moteur de snippets
      "saadparwaiz1/cmp_luasnip", -- Source: snippets
      "rafamadriz/friendly-snippets", -- Collection de snippets (React, etc.)
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Charger les snippets de friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        experimental = {
          ghost_text = true, -- Affiche un aperçu de la complétion
        },
        formatting = {
          format = function(entry, vim_item)
            -- Afficher la source de la complétion
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "path", priority = 500 },
        }, {
          { name = "luasnip", priority = 300 },
          { name = "buffer", priority = 100 },
        }),
      })
    end,
  },
}
