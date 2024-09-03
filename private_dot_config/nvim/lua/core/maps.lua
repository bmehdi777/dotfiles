local keymap = require("core.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local inoremap = keymap.inoremap

vim.g.mapleader = " "

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

-- Formatting
nnoremap("<leader>fp", "<cmd>:lua require('core.functions').format()<CR>", { silent=true })

-- Cheatsheet
nnoremap("<leader>?", ":Cheatsheet<CR>", { silent=true })

-- Buffer
nnoremap("<leader>bf",":bf<CR>", { silent=true })
nnoremap("<leader>bl",":bl<CR>", { silent=true })
nnoremap("<leader>bn",":bn<CR>", { silent=true })
nnoremap("<leader>bp",":bp<CR>", { silent=true })
nnoremap("<leader>bc",":bw<CR>", { silent=true })
-- Tab
nnoremap("<leader>tl", ":tabn<CR>", { silent=true })
nnoremap("<leader>th", ":tabp<CR>", { silent=true })
nnoremap("<leader>tG", ":tabl<CR>", { silent=true })
nnoremap("<leader>tgg", ":tabr<CR>", { silent=true })
nnoremap("<leader>tc", ":tabc<CR>", { silent=true })

-- Register
nnoremap("<leader>reg", ":reg<CR>", { silent=true })

-- Error display
nnoremap("<leader>e", ":lua vim.diagnostic.open_float()<CR>", { silent=true })

-- F1 key pisses me off
inoremap("<F1>", "", { silent=true }) 
vnoremap("<F1>", "", { silent=true }) 
nnoremap("<F1>", "", { silent=true }) 

-- Undotree
nnoremap("<leader>ut", ":lua vim.cmd.UndotreeToggle()<CR>", { silent=true })


-- Harpoon
nnoremap("<leader>h<Tab>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent=true })
nnoremap("<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { silent=true })

nnoremap("<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { silent=true })
nnoremap("<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { silent=true })
nnoremap("<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", { silent=true })
nnoremap("<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", { silent=true })
nnoremap("<leader>&", ":lua require('harpoon.ui').nav_file(1)<CR>", { silent=true })
nnoremap("<leader>é", ":lua require('harpoon.ui').nav_file(2)<CR>", { silent=true })
nnoremap("<leader>\"", ":lua require('harpoon.ui').nav_file(3)<CR>", { silent=true })
nnoremap("<leader>\'", ":lua require('harpoon.ui').nav_file(4)<CR>", { silent=true })

nnoremap("<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", { silent=true })
nnoremap("<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", { silent=true })

-- Aerial
nnoremap("<leader>a<Tab>", ":AerialToggle!<CR>", { silent=true })
nnoremap("<leader>aj", ":AerialNext<CR>", { silent=true })
nnoremap("<leader>ak", ":AerialPrev<CR>", { silent=true })

-- Lsp
nnoremap("<leader>lsph", ":lua vim.lsp.buf.hover()<CR>", { silent=true })
nnoremap("<leader>gdp", ":lua vim.diagnostic.goto_prev()<CR>", { silent=true })
nnoremap("<leader>gdn", ":lua vim.diagnostic.goto_next()<CR>", { silent=true })

-- Gitsign
nnoremap("<leader>bcl", ":Gitsigns toggle_current_line_blame<CR>", { silent=true})

-- Telescope
nnoremap("<C-p>", "<cmd>Telescope find_files<CR>")
nnoremap("<C-f>", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>gb", "<cmd>Telescope git_branches<CR>")
nnoremap("<leader>gc", "<cmd>Telescope git_commits<CR>")
nnoremap("<leader>tr", "<cmd> Telescope resume<CR>")

-- Oil
nnoremap("<leader>o", ":Oil --float<CR>", { silent = true })

-- DB - Dadbod
nnoremap("<leader>dbui", ":lua require('core.functions').openInNewTab(':DBUI')<CR>", { silent = true})

-- Fugitive
nnoremap("<leader>Gs", ":Git<CR>", { silent=true })
nnoremap("<leader>Gd", ":Gvdiffsplit!<CR>", { silent=true })
nnoremap("<leader>Go", ":GBrowse<CR>", { silent=true })
nnoremap("<leader>Gb", ":Git blame<CR>", { silent=true })
