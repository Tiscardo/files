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
vim.keymap.set({"n", "i", "s", "v", "o", "t", "l", "c"}, "<End>", "<ESC>", opts)
vim.keymap.set({ "n", "v" }, "b", "q", {noremap = false, silent = true})
vim.keymap.set({ "n", "v" }, "B", "Q", {noremap = false, silent = true})
vim.keymap.set({ "n", "v" }, "q", "b", {noremap = false, silent = true})
vim.keymap.set({ "n", "v" }, "Q", "B", {noremap = false, silent = true})

-- General Key Mappings
vim.keymap.set({ "n", "v" }, "K", "10kzz", opts)
vim.keymap.set({ "n", "v" }, "J", "10jzz", opts)
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
vim.keymap.set({"n"}, "gV", "`[v`]", opts) -- selects last paste area
vim.keymap.set({"v"}, "<", "<gv", opts) -- keep selection in visual mode when indenting
vim.keymap.set({"v"}, "p", "_dp", opts) -- paste over currently selected text without yanking it
vim.keymap.set({"n"}, "<C-<>", "gcc", opts) -- toogle comment 
vim.keymap.set({"n"}, "<C->>", "gcc", opts) -- toogle comment
vim.keymap.set({"i"}, "<C-<>", "<ESC>gcca", opts) -- leave i-mode, comment and re-enter i-mode
vim.keymap.set({"i"}, "<C->>", "<ESC>gcca", opts) -- leave i-mode, comment and re-enter i-mode
vim.keymap.set({"v"}, "<C-<>", "gc", opts) -- comment in visual mode
vim.keymap.set({"n","v"}, "öb", "]b", opts) 
vim.keymap.set({"n","v"}, "Öb", "[b", opts) 
vim.keymap.set({"n","v"}, "U", ":redo<CR>", opts) 
vim.keymap.set({"n","v"}, "<Leader>j", "J", opts) 
vim.keymap.set({"n","v"}, "==", "gg=G", opts) 

-- Save file with sudo
vim.keymap.set({"c"}, "w!!", "w !sudo tee %", opts)

-- Zentrieren bei Springen durch Suchergebnisse
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- Resize windows
vim.keymap.set("n", "<C-w><S-h>", ":resize -'<CR>", opts)
vim.keymap.set("n", "<C-w><S-j>", ":resize +'<CR>", opts)
vim.keymap.set("n", "<C-<>", "<C-w><", opts)
vim.keymap.set("n", "<C-S-<>", "<C-w>>", opts)

-- Split behaviour
vim.keymap.set({"n", "v", "i"}, "<C-n>", ":vnew<CR>", opts) 
vim.keymap.set({"n", "v", "i"}, "<C-t>", ":tabnew<CR>", opts) 
vim.keymap.set({"n", "v", "i"}, "<C-q>", ":bd<CR>", opts) 
vim.keymap.set({"n", "v", "i"}, "<C-q>!", ":bd!<CR>", opts) 

-- Delete copies into specific registers
vim.keymap.set({'n', 'v'}, 'dd', '"ddd', opts)
vim.keymap.set({'n', 'v'}, 'x', '"xx', opts)

-- Snacks 
vim.keymap.set('n', '<leader>d', ':lua Snacks.dashboard()<CR>')
vim.keymap.set('n', '<leader>e', ':lua Snacks.explorer()<CR>')

--
-- Leap
--
-- Spooky actions at a distance
vim.keymap.set({'n', 'x', 'o'}, '<Leader>s', '<Plug>(leap-remote)', opts)
vim.keymap.set({'n', 'x', 'o'}, '<Leader>S', '<Plug>(leap-anywhere)', opts)
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)', opts)
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)', opts)
-- Create remote versions of all a/i text objects by inserting `r`
-- into the middle (`iw` becomes `irw`, etc.).
-- A trick to avoid having to create separate hardcoded mappings for
-- each text object: when entering `ar`/`ir`, consume the next
-- character, and create the input from that character concatenated to
-- `a`/`i`.
do
  local remote_text_object = function (prefix)
     local ok, ch = pcall(vim.fn.getcharstr)  -- pcall for handling <C-c>
     if not ok or ch == vim.keycode('<esc>') then return end
     require('leap.remote').action { input = prefix .. ch }
  end
  vim.keymap.set({'x', 'o'}, 'ar', function () remote_text_object('a') end)
  vim.keymap.set({'x', 'o'}, 'ir', function () remote_text_object('i') end)
end

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

-- Complex leader help commands
-- rename the word under the cursor 
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sw", [[:s/\v(\w+)([., ])(\w+)/\3\2\1<CR>]])

-- Treesitter textobjects
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
