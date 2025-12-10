return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",          -- TypeScript/JavaScript
          "tailwindcss",    -- Tailwind CSS
          "jsonls",         -- JSON
          "bashls",         -- Bash
        },
        automatic_installation = true,
      })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "prettier",       -- JS/TS/JSON/CSS/HTML
          "stylua",         -- Lua
          "shfmt",          -- Shell
          -- Linters
          "eslint_d",       -- JS/TS (plus rapide qu'eslint)
          "shellcheck",     -- Shell
        },
        auto_update = false,
        run_on_start = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Important pour les capacités d'autocomplétion
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("lua_ls")

      -- TypeScript/React
      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsWithInsertText = true,
              importModuleSPecifierPreference = "relative",
            },
            suggest = {
              includeCompletionsForModuleExports = true,
              includeAutomaticOptionalChainCompletions = true,
              autoImport = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsWithInsertText = true,
              importModuleSPecifierPreference = "relative",
            },
            suggest = {
              includeCompletionsForModuleExports = true,
              includeAutomaticOptionalChainCompletions = true,
              autoImport = true,
            },
          },
        },
      }
      vim.lsp.enable("ts_ls")

      -- Tailwind CSS
      vim.lsp.config.tailwindcss = {
        capabilities = capabilities,
      }
      vim.lsp.enable("tailwindcss")

      -- JSON
      vim.lsp.config.jsonls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("jsonls")

      -- Bash
      vim.lsp.config.bashls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("bashls")

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>ci", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.addMissingImports.ts" },
          },
        })
      end, { desc = "Add missing imports" })
      vim.keymap.set("n", "<leader>co", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
          },
        })
      end, { desc = "Organize imports" })
      vim.keymap.set("n", "<leader>cr", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
          },
        })
      end, { desc = "Remove unused imports" })
    end
  }
}

