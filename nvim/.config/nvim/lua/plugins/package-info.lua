return {
  "vuki656/package-info.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "BufRead package.json",
  config = function()
    require("package-info").setup({
      colors = {
        up_to_date = "#3C4048",
        outdated = "#d19a66",
      },
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
        },
      },
      autostart = true,
      hide_up_to_date = false,
      hide_unstable_versions = false,
    })

    vim.keymap.set(
      "n",
      "<leader>ns",
      require("package-info").show,
      { silent = true, noremap = true, desc = "Show package info" }
    )
    vim.keymap.set(
      "n",
      "<leader>nc",
      require("package-info").hide,
      { silent = true, noremap = true, desc = "Hide package info" }
    )
    vim.keymap.set(
      "n",
      "<leader>nt",
      require("package-info").toggle,
      { silent = true, noremap = true, desc = "Toggle package info" }
    )
    vim.keymap.set(
      "n",
      "<leader>nu",
      require("package-info").update,
      { silent = true, noremap = true, desc = "Update package" }
    )
    vim.keymap.set(
      "n",
      "<leader>nd",
      require("package-info").delete,
      { silent = true, noremap = true, desc = "Delete package" }
    )
    vim.keymap.set(
      "n",
      "<leader>ni",
      require("package-info").install,
      { silent = true, noremap = true, desc = "Install package" }
    )
    vim.keymap.set(
      "n",
      "<leader>np",
      require("package-info").change_version,
      { silent = true, noremap = true, desc = "Change package version" }
    )
  end,
}
