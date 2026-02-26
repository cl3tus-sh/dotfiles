return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      delay = 300, -- délai avant affichage (ms)
    })

    -- Labels pour les groupes
    wk.add({
      { "<leader>f", group = "Fichiers/Recherche" },
      { "<leader>c", group = "Code/Quickfix" },
    })
  end,
}
