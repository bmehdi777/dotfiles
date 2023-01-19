local keymap = require("common.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local inoremap = keymap.inoremap

vim.g.mapleader = ","

-- Navigate through pane
nnoremap("<C-h>", ":wincmd h<CR>", { silent=true })
nnoremap("<C-j>", ":wincmd j<CR>", { silent=true })
nnoremap("<C-k>", ":wincmd k<CR>", { silent=true })
nnoremap("<C-l>", ":wincmd l<CR>", { silent=true })

-- Yank to clipboard
vnoremap("<leader>y", '"+y')
nnoremap("<leader>y", '"+y')

-- Tree
nnoremap("<C-b>", ":NvimTreeToggle<CR>", { silent=true })
inoremap("<C-b>", "<ESC>:NvimTreeToggle<CR>", { silent=true })

-- Prettier
nnoremap("<leader>fp", ":Prettier<CR>", { silent=true })

-- Cheatsheet
nnoremap("<leader>?", ":Cheatsheet<CR>", { silent=true })

-- Buffer
nnoremap("<leader>bf",":bf<CR>", { silent=true })
nnoremap("<leader>bl",":bl<CR>", { silent=true })
nnoremap("<leader>bn",":bn<CR>", { silent=true })
nnoremap("<leader>bp",":bp<CR>", { silent=true })
nnoremap("<leader>bc",":bw<CR>", { silent=true })
-- Tab
nnoremap("<leader>tn", ":tabn<CR>", { silent=true })
nnoremap("<leader>tp", ":tabp<CR>", { silent=true })
nnoremap("<leader>tl", ":tabl<CR>", { silent=true })
nnoremap("<leader>tf", ":tabr<CR>", { silent=true })
nnoremap("<leader>tc", ":tabc<CR>", { silent=true })

-- Register
nnoremap("<leader>reg", ":reg<CR>", { silent=true })

-- Error display
nnoremap("<space>e", ":lua vim.diagnostic.open_float()<CR>", { silent=true })
