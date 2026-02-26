return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "lua_ls",
          "cssls",
          "html",
          "jsonls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      -- Active les serveurs (nvim-lspconfig fournit les configs)
      vim.lsp.enable({
        "ts_ls",
        "lua_ls",
        "cssls",
        "html",
        "jsonls",
      })
    end,
  },
}
