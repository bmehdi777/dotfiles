local keymap = require("common.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local inoremap = keymap.inoremap

vim.g.mapleader = ","

-- Navigate through pane
nnoremap("<C-h>", ":wincmd h<CR>")
nnoremap("<C-j>", ":wincmd j<CR>")
nnoremap("<C-k>", ":wincmd k<CR>")
nnoremap("<C-l>", ":wincmd l<CR>")

-- Yank to clipboard
vnoremap("<leader>y", '"+y')
nnoremap("<leader>y", '"+y')

-- Tree
nnoremap("<C-b>", ":silent NvimTreeToggle<CR>", { silent=true })
inoremap("<C-b>", ":silent NvimTreeToggle<CR>", { silent=true })
