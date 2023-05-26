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

-- F1 key pisses me off
inoremap("<F1>", "", { silent=true }) 
vnoremap("<F1>", "", { silent=true }) 
nnoremap("<F1>", "", { silent=true }) 

-- Rust
nnoremap("<leader>rfmt", ":%! rustfmt<CR>:echo 'Rust format'<CR>",  { silent=true })

-- Undotree
nnoremap("<leader>ut", ":lua vim.cmd.UndotreeToggle()<CR>", { silent=true })


-- Harpoon
nnoremap("<leader>h<Tab>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent=true })
nnoremap("<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { silent=true })

nnoremap("<leader>h&", ":lua require('harpoon.ui').nav_file(1)<CR>", { silent=true })
nnoremap("<leader>hé", ":lua require('harpoon.ui').nav_file(2)<CR>", { silent=true })
nnoremap("<leader>h\"", ":lua require('harpoon.ui').nav_file(3)<CR>", { silent=true })
nnoremap("<leader>h\'", ":lua require('harpoon.ui').nav_file(4)<CR>", { silent=true })

nnoremap("<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", { silent=true })
nnoremap("<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", { silent=true })
