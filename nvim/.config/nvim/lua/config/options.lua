-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Numero de ligne
vim.opt.number = true -- Numeros absolus
vim.opt.relativenumber = true -- Numeros relatifs

-- Indentations
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Tabs --> espaces
vim.opt.smartindent = true

-- Rercherche
vim.opt.ignorecase = true -- Recherche insensible a la casse
vim.opt.smartcase = true  -- ...sauf si il y a une majuscule

-- Interface
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"   -- Colonne pour git/LSP pour eviter le decallage
vim.opt.cursorline = true    -- Surligne la ligne courante
vim.opt.scrolloff = 8        -- Garde x lignes visible au-dessus/dessous du curseur

-- Comportement
vim.opt.undofile = true           -- Historique undo persistant entre sessions
vim.opt.swapfile = false          -- Pas de fichier .swp
vim.opt.updatetime = 250          -- Delai le plus court (meilleur pour git/LSP)
vim.opt.clipboard = "unnamedplus" -- Press-paper system

