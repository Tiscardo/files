local opts = {noremap = true, silent = true}

--         Mode           | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
--         Command        +------+-----+-----+-----+-----+-----+------+------+
--         [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
--         n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
--         [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
--         i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
--         c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
--         v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
--         x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
--         s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
--         o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
--         t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
--         l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

-- Global Variables
vim.g.mapleader = " "
vim.keymap.set({"n", "i", "s", "v", "c", "o", "t"}, "<End>", "<ESC>")
-- General Key Mappings
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", opts)
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", opts)
vim.keymap.set({ "n", "v" }, "H", "^", opts)
vim.keymap.set({ "n", "v" }, "L", "$", opts)
vim.keymap.set({"n", "v"}, "Y", "yg_", opts) -- Yank bis Ende der Zeile ohne Whitespaces
vim.keymap.set({"n", "v"}, "V", "<C-V>", opts)
vim.keymap.set({"n", "v"}, "vv", "V", opts)
vim.keymap.set({"n", "v"}, "-", "/", opts)
vim.keymap.set({"n", "v"}, "ü", "<c-o>", opts)
vim.keymap.set({"n", "v"}, "Ü", "<c-i>", opts)
vim.keymap.set({"n", "v"}, "o", "o<Esc>", opts)
vim.keymap.set({"n", "v"}, "O", "O<Esc>", opts)
vim.keymap.set({"n", "v"}, "<", "<gv", opts) --keep selection in visual mode when indenting


-- Zentrieren bei Springen durch Suchergebnisse
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- better window navigation
--vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
--vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
--vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
--vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-w>H", ":resize -'<CR>", opts)
vim.keymap.set("n", "<C-w>J", ":resize +'<CR>", opts)
vim.keymap.set("n", "<C-w>K", "<C-w><", opts)
vim.keymap.set("n", "<C-w>L", "<C-W>>", opts)

-- Split behaviour
--vim.keymap.set({"n", "v", "i"}, "<C-n>", ":vnew<CR>", opts) 
vim.keymap.set({"n", "v", "i"}, "<C-t>", ":tabnew<CR>", opts) 
vim.keymap.set({"n", "v", "i"}, "<C-q>", ":bd<CR>", opts) 
vim.keymap.set({"n", "v", "i"}, "<C-q>!", ":bd!<CR>", opts) 

-- Delete copies into specific registers
vim.keymap.set({'n', 'v'}, 'd', '"dd', opts)
vim.keymap.set({'n', 'v'}, 'x', '"xx', opts)

-- mini.nvim Shortcuts 
vim.keymap.set("n", "<Leader>e", ":lua MiniFiles.open()<CR>", opts) 

-- Telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- Dashboard
vim.keymap.set('n', '<leader>d', ':Dashboard<CR>')

-- Leap
-- Spooky actions at a distance
vim.keymap.set({'n', 'x', 'o'}, '<Leader>s', function () require('leap.remote').action() end)

-- nvim-surround conflicts with leap
vim.g["surround_no_mappings"] = 1
-- Just the defaults copied here.
vim.keymap.set("n", "ds", "<Plug>Dsurround", opts)
vim.keymap.set("n", "cs", "<Plug>Csurround", opts)
vim.keymap.set("n", "cS", "<Plug>CSurround", opts)
vim.keymap.set("n", "ys", "<Plug>Ysurround", opts)
vim.keymap.set("n", "yS", "<Plug>YSurround", opts)
vim.keymap.set("n", "yss", "<Plug>Yssurround", opts)
vim.keymap.set("n", "ySs", "<Plug>YSsurround", opts)
vim.keymap.set("n", "ySS", "<Plug>YSsurround", opts)

-- fzf-lua
vim.keymap.set("n", "<leader>f", function() require('fzf-lua').files({ cwd = "~"}) end, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>b", function() require('fzf-lua').buffers() end )
vim.keymap.set("n", "<leader>t", function() require('fzf-lua').tabs() end )
vim.keymap.set("n", "<leader>h", function() require('fzf-lua').oldfiles() end )


