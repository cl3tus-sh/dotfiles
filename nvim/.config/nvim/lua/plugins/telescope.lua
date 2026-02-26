return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Chercher fichiers" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Chercher texte (grep)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers ouverts" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Aide Neovim" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fichiers récents" },
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Chercher fichiers" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
