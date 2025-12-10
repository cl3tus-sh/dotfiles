return  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "+",
            modified  = "\u{f040}",
            deleted   = "\u{f1f8}",
            renamed   = "\u{f061}",
            untracked = "?",
            ignored   = "\u{f05e}",
            unstaged  = "\u{f06a}",
            staged    = "\u{f00c}",
            conflict  = "\u{f071}",
          }
        }
      }
    })
    vim.keymap.set('n', '<leader>o', ':Neotree filesystem reveal right toggle<CR>')
  end
}
