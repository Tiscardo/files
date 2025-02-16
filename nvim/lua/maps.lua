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
vim.keymap.set({ "n", "v" }, "K", "10kzz", opts)
vim.keymap.set({ "n", "v" }, "J", "10jzz", opts)
vim.keymap.set({ "n", "v" }, "H", "_", opts)
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
vim.keymap.set({"v"}, "p", "_dp", opts) --paste over currently selected text without yanking it


-- Zentrieren bei Springen durch Suchergebnisse
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-w>H", ":resize -'<CR>", opts)
vim.keymap.set("n", "<C-w>J", ":resize +'<CR>", opts)
vim.keymap.set("n", "<C-w>K", "<C-w><", opts)
vim.keymap.set("n", "<C-w>L", "<C-W>>", opts)

-- Split behaviour
vim.keymap.set({"n", "v", "i"}, "<C-n>", ":vnew<CR>", opts) 
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
vim.keymap.set("n", "<leader>r", function() require('fzf-lua').lsp_references() end )
vim.keymap.set("n", "<leader>d", function() require('fzf-lua').lsp_definitions() end )
vim.keymap.set("n", "<leader>m", function() require('fzf-lua').marks() end )

--win-mover
--local win_mover = require('win-mover')
--win_mover.setup({
--  ignore = {
--    enable = true,
--    filetypes = { 'NvimTree', 'neo-tree', 'Outline', 'toggleterm' },
--  },
--  highlight = {
--    color = '#2e3440',
--    transparency = 60,
--  },
--  move_mode = {
--    keymap = {
--      h = win_mover.ops.move_left,
--      j = win_mover.ops.move_down,
--      k = win_mover.ops.move_up,
--      l = win_mover.ops.move_right,
--
--      H = win_mover.ops.move_far_left,
--      J = win_mover.ops.move_far_down,
--      K = win_mover.ops.move_far_up,
--      L = win_mover.ops.move_far_right,
--
--      q = win_mover.ops.quit,
--      ['<End>'] = win_mover.ops.quit,
--    },
--  },
--})
--vim.keymap.set("n", "<leader>w", win_mover.enter_move_mode, { noremap = true, silent = true })
