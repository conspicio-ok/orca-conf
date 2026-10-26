local map = vim.keymap.set

-- Effacer le surlignage de recherche
map("n", "<Space>", "<cmd>nohlsearch<CR>", { silent = true })

-- Navigation entre splits (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Déplacement de ligne avec réindentation (Alt+Up/Down et Alt+k/j)
map("n", "<M-Down>", ":m .+1<CR>==",        { silent = true })
map("n", "<M-Up>",   ":m .-2<CR>==",        { silent = true })
map("n", "<M-j>",    ":m .+1<CR>==",        { silent = true })
map("n", "<M-k>",    ":m .-2<CR>==",        { silent = true })
map("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { silent = true })
map("i", "<M-Up>",   "<Esc>:m .-2<CR>==gi", { silent = true })
map("i", "<M-j>",    "<Esc>:m .+1<CR>==gi", { silent = true })
map("i", "<M-k>",    "<Esc>:m .-2<CR>==gi", { silent = true })
map("v", "<M-Down>", ":m '>+1<CR>gv=gv",        { silent = true })
map("v", "<M-Up>",   ":m '<-2<CR>gv=gv",        { silent = true })
map("v", "<M-j>",    ":m '>+1<CR>gv=gv",        { silent = true })
map("v", "<M-k>",    ":m '<-2<CR>gv=gv",        { silent = true })
