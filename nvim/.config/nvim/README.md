# Configuration Neovim

Configuration Neovim optimisée pour le développement TypeScript/React avec LSP, formatting, linting et bien plus.

## 📋 Table des matières

- [Plugins installés](#plugins-installés)
- [Keymaps](#keymaps)
- [LSP Servers](#lsp-servers)
- [Formatters & Linters](#formatters--linters)

---

## 🔌 Plugins installés

### 🎨 Interface & Thème

#### Catppuccin
**Utilité** : Thème de couleurs moderne et agréable
**Config** : `lua/plugins/catppuccin.lua`

#### Lualine
**Utilité** : Statusline élégante avec informations (mode, fichier, git, diagnostics)
**Config** : `lua/plugins/lualine.lua`

#### Neo-tree
**Utilité** : Explorateur de fichiers moderne avec git integration
**Config** : `lua/plugins/neo-tree.lua`
**Keymaps** :
- `<leader>o` : Toggle Neo-tree

#### Indent Blankline
**Utilité** : Affiche des lignes verticales pour visualiser l'indentation
**Config** : `lua/plugins/indent-blankline.lua`

#### Which-key
**Utilité** : Affiche les keymaps disponibles après avoir tapé une touche leader
**Config** : `lua/plugins/which-key.lua`
**Comportement** : S'affiche automatiquement après 300ms

---

### 🔍 Navigation & Recherche

#### Telescope
**Utilité** : Fuzzy finder pour fichiers, texte, buffers, git, etc.
**Config** : `lua/plugins/telescope.lua`
**Keymaps** :
- `<C-p>` : Chercher fichiers
- `<leader>ff` : Find files
- `<leader>fg` : Grep (chercher dans le contenu)
- `<leader>fb` : Find buffers
- `<leader>fh` : Find help

#### Harpoon
**Utilité** : Navigation ultra-rapide entre vos fichiers favoris
**Config** : `lua/plugins/harpoon.lua`
**Keymaps** :
- `<leader>a` : Ajouter le fichier actuel à Harpoon
- `<C-e>` : Toggle le menu Harpoon
- `<C-h>` : Aller au fichier 1
- `<C-j>` : Aller au fichier 2
- `<C-k>` : Aller au fichier 3
- `<C-l>` : Aller au fichier 4
- `<C-S-P>` : Fichier précédent
- `<C-S-N>` : Fichier suivant

#### Trouble
**Utilité** : Liste élégante des diagnostics, erreurs, warnings, références
**Config** : `lua/plugins/trouble.lua`
**Keymaps** :
- `<leader>xx` : Toggle diagnostics (tous)
- `<leader>xX` : Diagnostics du buffer actuel
- `<leader>xs` : Symbols
- `<leader>xl` : LSP definitions/references
- `<leader>xL` : Location list
- `<leader>xQ` : Quickfix list

---

### 💻 LSP & Complétion

#### Mason
**Utilité** : Gestionnaire de LSP servers, formatters, linters
**Config** : `lua/plugins/lsp-config.lua`
**Commande** : `:Mason`

#### nvim-lspconfig
**Utilité** : Configuration des LSP servers
**Config** : `lua/plugins/lsp-config.lua`
**LSP Servers installés** :
- `lua_ls` : Lua
- `ts_ls` : TypeScript/JavaScript
- `tailwindcss` : Tailwind CSS
- `jsonls` : JSON
- `bashls` : Bash

**Keymaps LSP** :
- `K` : Hover documentation
- `gd` : Go to definition
- `<leader>ca` : Code actions
- `<leader>ci` : Add missing imports (TS)
- `<leader>co` : Organize imports (TS)
- `<leader>cr` : Remove unused imports (TS)

#### nvim-cmp
**Utilité** : Moteur d'autocomplétion intelligent
**Config** : `lua/plugins/nvim-cmp.lua`
**Keymaps** :
- `<C-Space>` : Trigger completion
- `<C-e>` : Abort completion
- `<CR>` : Confirm
- `<Tab>` : Next item / expand snippet
- `<S-Tab>` : Previous item

**Sources** :
- LSP
- Buffer
- Path
- Snippets (LuaSnip + friendly-snippets)

---

### 🎯 Formatters & Linters

#### Conform.nvim
**Utilité** : Formatting automatique ou manuel
**Config** : `lua/plugins/conform.lua`
**Formatters** :
- `prettier` : JS/TS/React/JSON/CSS/HTML/YAML/Markdown
- `stylua` : Lua
- `shfmt` : Shell scripts

**Keymaps** :
- `<leader>cf` : Format fichier ou sélection
**Comportement** : Format automatique au save

#### nvim-lint
**Utilité** : Linting en temps réel
**Config** : `lua/plugins/nvim-lint.lua`
**Linters** :
- `eslint_d` : JS/TS/React (version rapide)
- `shellcheck` : Shell scripts

**Keymaps** :
- `<leader>cl` : Lint manuellement
**Comportement** : Auto-lint au save et en mode normal

---

### 🌳 Treesitter

#### nvim-treesitter
**Utilité** : Parsing avancé pour coloration syntaxique, indentation, etc.
**Config** : `lua/plugins/treesitter.lua`
**Langages** : Auto-détection et installation

---

### ✏️ Édition

#### nvim-autopairs
**Utilité** : Auto-ferme les parenthèses, brackets, quotes
**Config** : `lua/plugins/autopairs.lua`
**Comportement** : Automatique en insert mode

#### nvim-ts-autotag
**Utilité** : Auto-ferme les tags HTML/JSX
**Config** : `lua/plugins/autotag.lua`
**Comportement** : Automatique en tapant `>`

#### Comment.nvim
**Utilité** : Commenter/décommenter du code intelligemment
**Config** : `lua/plugins/comment.lua`
**Keymaps** :
- `gcc` : Toggle comment ligne
- `gbc` : Toggle block comment
- `gc` + mouvement : Comment (ex: `gcap` pour paragraph)
- `gb` + mouvement : Block comment
- `gcO` : Comment ligne au-dessus
- `gco` : Comment ligne en-dessous
- `gcA` : Comment en fin de ligne

En mode visuel :
- `gc` : Comment sélection
- `gb` : Block comment sélection

---

### 🔧 Git

#### Gitsigns
**Utilité** : Décorations git dans la marge (lignes ajoutées/modifiées/supprimées)
**Config** : `lua/plugins/gitsigns.lua`
**Keymaps** :
- `]h` : Prochain hunk
- `[h` : Hunk précédent
- `<leader>hp` : Preview hunk
- `<leader>hs` : Stage hunk
- `<leader>hr` : Reset hunk
- `<leader>hS` : Stage buffer
- `<leader>hR` : Reset buffer
- `<leader>hu` : Undo stage hunk
- `<leader>hb` : Blame line
- `<leader>hd` : Diff this

#### LazyGit
**Utilité** : Interface TUI pour git (commits, push, pull, branches, etc.)
**Config** : `lua/plugins/lazygit.lua`
**Keymaps** :
- `<leader>gg` : Ouvrir LazyGit

**Note** : Nécessite `lazygit` installé sur le système

---

### 📦 Utilitaires

#### Todo Comments
**Utilité** : Highlight les TODO, FIXME, NOTE, etc. avec couleurs
**Config** : `lua/plugins/todo-comments.lua`
**Mots-clés détectés** :
- `TODO` : Tâches à faire
- `FIXME` / `BUG` : Bugs à corriger
- `HACK` : Code à améliorer
- `WARN` / `WARNING` : Avertissements
- `PERF` / `OPTIMIZE` : Optimisations
- `NOTE` / `INFO` : Notes
- `TEST` : Tests

**Keymaps** :
- `]t` : Prochain TODO
- `[t` : TODO précédent
- `<leader>ft` : Chercher tous les TODOs

#### Package Info
**Utilité** : Affiche les versions de packages dans `package.json`
**Config** : `lua/plugins/package-info.lua`
**Keymaps** (dans package.json) :
- `<leader>ns` : Show package versions
- `<leader>nc` : Hide package info
- `<leader>nt` : Toggle package info
- `<leader>nu` : Update package
- `<leader>nd` : Delete package
- `<leader>ni` : Install package
- `<leader>np` : Change version

---

## ⌨️ Keymaps récapitulatifs

### Leader = `<Space>` (par défaut)

#### Fichiers & Navigation
| Keymap | Action |
|--------|--------|
| `<C-p>` | Chercher fichiers |
| `<leader>ff` | Find files |
| `<leader>fg` | Grep (chercher texte) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help |
| `<leader>ft` | Find TODOs |
| `<leader>o` | Toggle Neo-tree |
| `<leader>a` | Ajouter à Harpoon |
| `<C-e>` | Menu Harpoon |
| `<C-h/j/k/l>` | Harpoon fichiers 1-4 |

#### Code & LSP
| Keymap | Action |
|--------|--------|
| `K` | Hover doc |
| `gd` | Go to definition |
| `<leader>ca` | Code actions |
| `<leader>cf` | Format |
| `<leader>cl` | Lint |
| `<leader>ci` | Add imports (TS) |
| `<leader>co` | Organize imports (TS) |
| `<leader>cr` | Remove unused imports (TS) |

#### Git
| Keymap | Action |
|--------|--------|
| `<leader>gg` | LazyGit |
| `]h` / `[h` | Next/Prev hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |

#### Diagnostics & Erreurs
| Keymap | Action |
|--------|--------|
| `<leader>xx` | All diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xs` | Symbols |
| `<leader>xl` | LSP refs |

#### Édition
| Keymap | Action |
|--------|--------|
| `gcc` | Toggle comment ligne |
| `gc` (visual) | Comment sélection |
| `]t` / `[t` | Next/Prev TODO |

#### Package.json
| Keymap | Action |
|--------|--------|
| `<leader>ns` | Show versions |
| `<leader>nu` | Update package |
| `<leader>ni` | Install package |

---

## 🛠️ Installation

1. Clone cette config dans `~/.config/nvim/`
2. Installe Neovim >= 0.10
3. Installe `lazygit` (pour le plugin lazygit) :
   ```bash
   # Arch Linux
   sudo pacman -S lazygit
   ```
4. Lance Neovim
5. Les plugins s'installeront automatiquement via lazy.nvim
6. Mason installera les LSP servers, formatters et linters

## 📝 Structure

```
.
├── init.lua                 # Point d'entrée
├── lua/
│   ├── vim-options.lua      # Options Neovim de base
│   └── plugins/             # Configuration des plugins
│       ├── autopairs.lua
│       ├── autotag.lua
│       ├── catppuccin.lua
│       ├── comment.lua
│       ├── conform.lua
│       ├── gitsigns.lua
│       ├── harpoon.lua
│       ├── indent-blankline.lua
│       ├── lazygit.lua
│       ├── lsp-config.lua
│       ├── lualine.lua
│       ├── neo-tree.lua
│       ├── nvim-cmp.lua
│       ├── nvim-lint.lua
│       ├── package-info.lua
│       ├── telescope.lua
│       ├── todo-comments.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       └── which-key.lua
└── README.md
```

## 🎯 Workflow recommandé

### Navigation rapide
1. Utilise **Harpoon** pour tes fichiers principaux (`<leader>a` puis `<C-h/j/k/l>`)
2. **Telescope** pour chercher (`<C-p>`)
3. **Neo-tree** pour l'arborescence (`<leader>o`)

### Coding
1. **LSP** pour autocomplétion, hover, definition
2. **Conform** formate au save automatiquement
3. **nvim-lint** détecte les erreurs en temps réel
4. **Comment.nvim** pour commenter (`gcc`)
5. **autopairs** et **autotag** pour auto-fermeture

### Git
1. **Gitsigns** montre les changements dans la marge
2. **LazyGit** (`<leader>gg`) pour commits, push, pull
3. **Telescope git_status** pour voir les fichiers modifiés

### Debug
1. **Trouble** (`<leader>xx`) pour voir toutes les erreurs
2. **Todo Comments** (`<leader>ft`) pour tracker les TODOs
3. **Which-key** pour retrouver tes keymaps

---

## 🚀 Tips

- Tape `<leader>` et attends 300ms → **which-key** affiche les options
- Dans un fichier TS/React, `<leader>ci` ajoute les imports manquants automatiquement
- `<leader>gg` ouvre LazyGit, `q` pour fermer
- Les TODOs sont auto-colorés : `// TODO: faire ça`
- Format au save est activé par défaut, désactive dans `conform.lua` si besoin

---

**Enjoy coding! 🎉**
