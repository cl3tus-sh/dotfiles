return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        treesitter = true,
        telescope = true,
        cmp = true,
        gitsigns = true,
        native_lsp = { 
          enabled = true,
          inlay_hints = { background = true },
        },
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}

