vim.g.mapleader = " "

-- Disalbe arrows
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

vim.keymap.set('i', '<Up>', '<Nop>')
vim.keymap.set('i', '<Down>', '<Nop>')
vim.keymap.set('i', '<Left>', '<Nop>')
vim.keymap.set('i', '<Right>', '<Nop>')

vim.keymap.set('v', '<Up>', '<Nop>')
vim.keymap.set('v', '<Down>', '<Nop>')
vim.keymap.set('v', '<Left>', '<Nop>')
vim.keymap.set('v', '<Right>', '<Nop>')

vim.keymap.set('n', '<C-k>', 'gg=G')
vim.keymap.set('n', '<Tab>', ':bnext<CR>');
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>');

-- Copy to clipboard with Ctrl+c
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<C-c>', '"+yy', { desc = 'Copy line to clipboard' })


