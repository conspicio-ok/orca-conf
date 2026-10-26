local opt = vim.opt

-- Numérotation
opt.number			= true
opt.relativenumber	= true

-- Indentation
opt.expandtab	= false
opt.tabstop		= 4
opt.shiftwidth	= 4
opt.smartindent	= true

-- Affichage
opt.cursorline		= true
opt.wrap			= false
opt.colorcolumn		= "80"
opt.scrolloff		= 8
opt.signcolumn		= "number"
opt.termguicolors	= true

-- Recherche
opt.ignorecase	= true
opt.smartcase	= true
opt.hlsearch	= true
opt.incsearch	= true

-- Comportement
opt.splitright	= true
opt.splitbelow	= true
opt.undofile	= true
opt.clipboard	= "unnamedplus"

-- Completion
opt.completeopt	= { "menuone", "noselect", "popup" }
