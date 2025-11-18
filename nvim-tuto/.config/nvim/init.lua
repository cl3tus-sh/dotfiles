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

-- Ouvrir un nouveau split
map('n', '<leader>v', ':vsp<CR>')
map('n', '<leader>h', ':sp<CR>')


