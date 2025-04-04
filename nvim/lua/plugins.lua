local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system(
                {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", 
                        lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        { "folke/snacks.nvim", priority = 1000, lazy = false, ---@type snacks.Config
                opts = {
                        bigfile = { enabled = false },
                        dashboard = {  sections = {
                           { section = "header" },
                           { section = "keys", gap = 0, padding = 1 },
                           { icon = " ", title = "Recent Files", limit = 9, section = "recent_files",  padding = { 2, 1 } },
                           { section = "startup" },
                        }},
                        explorer = { enabled = true },
                        image = { enabled = true },
                        input = { enabled = true },
                        picker = { enabled = true },
                        notifier = { enabled = false },
                        quickfile = { enabled = false },
                        scope = { enabled = false },
                        scroll = { enabled = true },
                },
                keys = {
                        { "<C-f>", function() Snacks.picker.files({ cwd = "~"}) end, desc = "Find Config File" }, -- search in home directory
                        { "<C-d>", function() Snacks.picker.files() end, desc = "Find Files" }, -- search in working directory
                        { "<C-<space>>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
                        { "<C-b>", function() Snacks.picker.buffers() end, desc = "Buffers" },
                        { "<C-g>", function() Snacks.picker.grep() end, desc = "Grep" },
                        { "<C-h>", function() Snacks.picker.recent() end, desc = "Recent" },
                        { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo History" },
                },},
        { 'echasnovski/mini.ai', version = '*'},
        { 'echasnovski/mini.move',  version = '*'},
        { 'echasnovski/mini.comment', version =  '*'},
        { 'chentoast/marks.nvim', event = "VeryLazy", version = '*', opts = {}},
        -- { 'tpope/vim-repeat', version = "*"},
        { 'ggandor/leap.nvim' },
        { 'ggandor/flit.nvim', lazy = true, version = '*'},
        { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = function()
                require("nvim-surround").setup({ }) end },
        { "neanias/everforest-nvim", version = false, lazy = false, priority = 1000, 
                config = function() require("everforest").setup({ }) end, },
        { "chrisgrieser/nvim-spider", lazy = true,
                keys = { { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, },
                        { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, },
                        { "q", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } } }},
        { "folke/which-key.nvim", keymap = { preset = 'default' },
                appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = 'mono' },
                sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, }, },
        { 'saghen/blink.cmp', version = '*', lazy = true,
                opts = { keymap = { preset = 'super-tab',
                ['<End>'] = { 'hide' },
                ['<C-j>'] = { 'select_next', 'fallback' },
                ['<C-k>'] = { 'select_next', 'fallback' }, },
                appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = 'mono' },
                sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, }, }, },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
                config = function () local configs = require("nvim-treesitter.configs")
                        configs.setup({ ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                                auto_install = false,
                                highlight = { enable = true, additional_vim_regex_highlighting = false, },
                                incrementalincremental_selection = { enable = true,
                                        keymaps = { init_selection = "gnn", -- set to `false` to disable one of the mappings
                                                node_incremental = "grn",
                                                scope_incremental = "grc",
                                                node_decremental = "grm", }, },
                                indent = { enable = true }, }) end },
        { 'jake-stewart/multicursor.nvim', branch = "1.0", lazy = true,
                config = function()
                        local mc = require("multicursor-nvim")
                        mc.setup()
                        local set = vim.keymap.set
                        -- Add or skip cursor above/below the main cursor.
                        set({"n", "v"}, "<C-k>", function() mc.lineAddCursor(-1) end)
                        set({"n", "v"}, "<C-j>", function() mc.lineAddCursor(1) end)
                        set({"n", "v"}, "<C-S-k>", function() mc.lineSkipCursor(-1) end)
                        set({"n", "v"}, "<C-S-j>", function() mc.lineSkipCursor(1) end)
                        -- Add or skip adding a new cursor by matching word/selection
                        set({"n", "v"}, "<C-ü>", function() mc.matchAddCursor(1) end)
                        set({"n", "v"}, "<C-S-ü>", function() mc.matchSkipCursor(1) end)
                        set({"n", "v"}, "<C-#>", function() mc.matchAddCursor(-1) end)
                        set({"n", "v"}, "<C-S-#>", function() mc.matchSkipCursor(-1) end)
                        -- Add all matches in the document
                        set({"n", "v"}, "<leader>A", mc.matchAllAddCursors)
                        -- Add and remove cursors with control + left click.
                        set("n", "<c-leftmouse>", mc.handleMouse)
                        set("n", "<esc>", function()
                                if not mc.cursorsEnabled() then
                                        mc.enableCursors()
                                elseif mc.hasCursors() then
                                        mc.clearCursors()
                                else
                                        -- Default <esc> handler.
                                end
                        end)
                        -- bring back cursors if you accidentally clear them
                        set("n", "<leader>gv", mc.restoreCursors)
                        -- Align cursor columns.
                        set("n", "<leader>a", mc.alignCursors)
                        -- Append/insert for each line of visual selections.
                        set("v", "I", mc.insertVisual)
                        set("v", "A", mc.appendVisual)
                        -- match new cursors within visual selections by regex.
                        set("v", "M", mc.matchCursors)
                        -- Rotate visual selection contents.
                        set("v", "<leader>t", function() mc.transposeCursors(1) end)
                        set("v", "<leader>T", function() mc.transposeCursors(-1) end)
                        -- Jumplist support
                        set({"v", "n"}, "<c-i>", mc.jumpForward)
                        set({"v", "n"}, "<c-o>", mc.jumpBackward)
                        -- Customize how cursors look.
                        local hl = vim.api.nvim_set_hl
                        hl(0, "MultiCursorCursor", { link = "Cursor" })
                        hl(0, "MultiCursorVisual", { link = "Visual" })
                        hl(0, "MultiCursorSign", { link = "SignColumn"})
                        hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
                        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
                        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
                end
        },
})
