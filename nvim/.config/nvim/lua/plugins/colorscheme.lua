return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Charge en premier
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
