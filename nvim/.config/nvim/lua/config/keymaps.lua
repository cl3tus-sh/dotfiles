local map = vim.keymap.set

-- Raccourci pour quitter/sauvegarder plus vite
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Sauvegarder" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quitter" })

-- Effacer le surlignage de recharge
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Effacer recherche" })

-- Naviguer entre les fenetres (splits)
-- map("n", "<C-h>", "<C-w>h", { desc = "Fenetre gauche" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Fenetre bas" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Fenetre haut" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Fenetre droite" })
--
-- Deplacer des lignes en mode visuel
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Deplacer ligne vers le bas" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Deplacer ligne vers le haut" })

-- Garder le curseur centre lors du scroll
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centre" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centre" })

-- Garder le curseur centré lors de la recherche
map("n", "n", "nzzzv", { desc = "Resultat suivant centre" })
map("n", "N", "Nzzzv", { desc = "Resultat précédent centre" })
