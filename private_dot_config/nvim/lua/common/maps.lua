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
inoremap("<leader>?", ":Cheatsheet<CR>", { silent=true })
vnoremap("<leader>?", ":Cheatsheet<CR>", { silent=true })
