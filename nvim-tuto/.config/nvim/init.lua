-- ======== Options de base ========
local opt = vim.opt

opt.number = true 	       	-- afficher les numeros de ligne
opt.relativenumber = true 	-- numeros de ligne relatifs
opt.tabstop = 2 		        -- largeur d'un tab = 2 espaces
opt.shiftwidth = 2 		      -- indentation automatique = 2
opt.expandtab = true		    -- convertir tab -> spaces
opt.smartindent = true		  -- indentation intelligente
opt.wrap = false		        -- pas de retour a la ligne automatique
opt.termguicolors = true	  -- couleurs modernisees
opt.cursorline = true	  	  -- hightlight de la ligne active
opt.signcolumn = "yes"      -- garder la colonne pour LSP/git
opt.clipboard = "unnamedplus"-- copier/coller avec le system
opt.ignorecase = true       -- recharche insensible a la casse...
opt.smartcase = true        -- ... sauf si tu mets des majuscules

-- ======== Mappings utiles =======
local map = vim.keymap.set

-- Desactiver les fleches directionnes
map({'n', 'i', 'v'}, '<Up>', '<Nop>')
map({'n', 'i', 'v'}, '<Down>', '<Nop>')
map({'n', 'i', 'v'}, '<Left>', '<Nop>')
map({'n', 'i', 'v'}, '<Right>', '<Nop>')

-- Double ESC pour enlever les highlight de recherche
map('n', '<Esc><Esc>', ':nohlsearch<CR>')

-- Deplacement rapide entre splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Leader key = espace (standard moderne)
vim.g.mapleader = " "

map('n', '<leader>v', ':vsp<CR>')   -- ouvrire un split vertical
map('n', '<leader>h', ':sp<CR>')    -- ouvrir un split horizontal
map('n', '<leader>c', ':close<R>')  -- fermer un split
map('n', '<leader>d', 'yyp')        -- dupliquer une ligne
map('n', '<leader>e', ':edit ')     -- ouvrir rapidement un fichier
map('n', '<leader>s', ':w<CR>')     -- Sauvegarder
map('n', '<leader>q', ':q<CR>')     -- Sauvegarder
map('n', '<leader>x', ':bd<CR>')    -- fermer le buffer courrant

-- Deplacer des lignes
map('n', '<A-j>', ':m .+1<CR>==')   -- deplacer vers le bas 
map('n', '<A-k>', ':m .-2<CR>==')   -- deplacer vers le haut
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- ======== Plugins ========
local lazypath = vim.fn.stdpath('config') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim...')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
