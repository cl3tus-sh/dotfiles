-- Keymaps additionnels (les defaults sont déjà: grn, gra, grr, K)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    -- Navigation (en plus des defaults)
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("<leader>d", vim.diagnostic.open_float, "Show diagnostic")

    -- Diagnostics navigation
    map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
  end,
})

-- Config des diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
