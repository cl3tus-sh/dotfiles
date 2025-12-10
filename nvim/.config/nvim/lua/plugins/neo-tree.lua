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
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,

      filesystem = {
        follow_current_file = {
          enabled = true,          -- Auto-focus sur le fichier actuel
          leave_dirs_open = false,
        },
        use_libuv_file_watcher = true, -- Auto-refresh quand fichiers changent
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

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
      },

      event_handlers = {
        {
          event = "file_added",
          handler = function()
            vim.cmd("Neotree refresh")
          end
        },
        {
          event = "file_deleted",
          handler = function()
            vim.cmd("Neotree refresh")
          end
        },
      }
    })
    vim.keymap.set('n', '<leader>o', ':Neotree filesystem reveal right toggle<CR>')
  end
}
