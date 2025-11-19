return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    { "neovim/nvim-lspconfig", branch = "master" },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = { "ts_ls", "html", "jsonls" },
      automatic_installation = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      end

      map("n", "K", vim.lsp.buf.hover)          -- Doc sous le curseur
      map("n", "gd", vim.lsp.buf.definition)    -- Aller a la definition
      map("n", "gr", vim.lsp.buf.references)    -- Toutes les references
      map("n", "<leader>rn", vim.lsp.buf.rename)    -- Rename symbol
      map("n", "<leader>ca", vim.lsp.buf.code_action)    -- Code actions (quick fix)
    end

    -- TypeScript / JavaScript (tsserver remplacé par ts_ls)
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
          },
        },
      },
    })

    -- HTML
    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- JSON
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Activer les LSP pour les filetypes appropriés
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
  end,
}
