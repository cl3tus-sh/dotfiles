return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- Source LSP
      "hrsh7th/cmp-buffer",        -- Source buffer courant
      "hrsh7th/cmp-path",          -- Source chemins fichiers
      "L3MON4D3/LuaSnip",          -- Moteur de snippets
      "saadparwaiz1/cmp_luasnip",  -- Source snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- Navigation dans le menu
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          -- Scroll dans la doc
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Confirmer la sélection
          ["<Return>"] = cmp.mapping.confirm({ select = true }),

          -- Trigger manuel
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Annuler
          ["<C-e>"] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
