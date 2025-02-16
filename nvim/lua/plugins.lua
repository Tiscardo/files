local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system(
                {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", 
                        lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        { 'echasnovski/mini.ai', version = '*'},
        { 'echasnovski/mini.move',  version = '*'},
        { 'echasnovski/mini.comment', version =  '*'},
        { 'echasnovski/mini.files', version = '*'},
       -- { 'chentoast/marks.nvim', event = "VeryLazy", version = '*', opts = {}},
        { 'jake-stewart/multicursor.nvim', branch = "1.0",
                config = function()
                        local mc = require("multicursor-nvim")

                        mc.setup()

                        local set = vim.keymap.set

                        -- Add or skip cursor above/below the main cursor.
                        set({"n", "v"}, "<C-k>",
                                function() mc.lineAddCursor(-1) end)
                        set({"n", "v"}, "<C-j>",
                                function() mc.lineAddCursor(1) end)
                        set({"n", "v"}, "<C-S-k>",
                                function() mc.lineSkipCursor(-1) end)
                        set({"n", "v"}, "<C-S-j>",
                                function() mc.lineSkipCursor(1) end)
                        -- Add or skip adding a new cursor by matching word/selection
                        set({"n", "v"}, "<C-+>",
                                function() mc.matchAddCursor(1) end)
                        set({"n", "v"}, "<C-*>",
                                function() mc.matchSkipCursor(1) end)
                        set({"n", "v"}, "<C-#>",
                                function() mc.matchAddCursor(-1) end)
                        set({"n", "v"}, "<C-S-#>",
                                function() mc.matchSkipCursor(-1) end)

                        -- Add all matches in the document
                        set({"n", "v"}, "<leader>A", mc.matchAllAddCursors)

                        -- You can also add cursors with any motion you prefer:
                        -- set("n", "<right>", function()
                        --     mc.addCursor("w")
                        -- end)
                        -- set("n", "<leader><right>", function()
                        --     mc.skipCursor("w")
                        -- end)

                        -- Rotate the main cursor.
                        set({"n", "v"}, "<left>", mc.nextCursor)
                        set({"n", "v"}, "<right>", mc.prevCursor)

                        -- Delete the main cursor.
                        set({"n", "v"}, "<leader>x", mc.deleteCursor)

                        -- Add and remove cursors with control + left click.
                        set("n", "<c-leftmouse>", mc.handleMouse)

                        -- Easy way to add and remove cursors using the main cursor.
                        --set({"n", "v"}, "<c-q>", mc.toggleCursor)

                        -- Clone every cursor and disable the originals.
                        --set({"n", "v"}, "<leader><c-q>", mc.duplicateCursors)

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

                        -- Split visual selections by regex.
                        --set("v", "S", mc.splitCursors)

                        -- Append/insert for each line of visual selections.
                        set("v", "I", mc.insertVisual)
                        set("v", "A", mc.appendVisual)

                        -- match new cursors within visual selections by regex.
                        set("v", "M", mc.matchCursors)

                        -- Rotate visual selection contents.
                        set("v", "<leader>t",
                                function() mc.transposeCursors(1) end)
                        set("v", "<leader>T",
                                function() mc.transposeCursors(-1) end)

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
        { 'tpope/vim-repeat', version = "*"},
        { 'ggandor/leap.nvim' },
        { 'ggandor/flit.nvim', lazy = true, version = '*'},
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function ()
                        local configs = require("nvim-treesitter.configs")
                        configs.setup({
                                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                                auto_install = false,
                                highlight = {
                                        enable = true,
                                        additional_vim_regex_highlighting = false,
                                },
                                incrementalincremental_selection = {
                                        enable = true,
                                        keymaps = {
                                                init_selection = "gnn", -- set to `false` to disable one of the mappings
                                                node_incremental = "grn",
                                                scope_incremental = "grc",
                                                node_decremental = "grm",
                                        },
                                },
                                indent = { enable = true },
                        })
                end
        },
        {
                "kylechui/nvim-surround",
                version = "*", -- Use for stability; omit to use `main` branch for the latest features
                event = "VeryLazy",
                config = function()
                        require("nvim-surround").setup({
                                -- Configuration here, or leave empty to use defaults
                        })
                end
        },
        {
                "neanias/everforest-nvim",
                version = false,
                lazy = false,
                priority = 1000, -- make sure to load this before all the other start plugins
                -- Optional; default configuration will be used if setup isn't called.
                config = function()
                        require("everforest").setup({
                                -- Your config here
                        })
                end,
        },
        {
                'nvimdev/dashboard-nvim',
                event = 'VimEnter',
                config = function()
                        require('dashboard').setup {
                                -- config
                        }
                end,
                dependencies = { {'nvim-tree/nvim-web-devicons'}}
        },
        {
                "ibhagwan/fzf-lua",
                -- optional for icon support
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                        -- calling `setup` is optional for customization
                        require("fzf-lua").setup({"max-perf",winopts={cwd="~"}})
                end
        },
        --{ "chrisgrieser/nvim-spider", lazy = true,
        --        keys = {
        --                {
        --                        "e",
        --                        "<cmd>lua require('spider').motion('e')<CR>",
        --                        mode = { "n", "o", "x" },
        --                },
        --                {
        --                        "w",
        --                        "<cmd>lua require('spider').motion('w')<CR>",
        --                        mode = { "n", "o", "x" },
        --                },
        --                {
        --                        "b",
        --                        "<cmd>lua require('spider').motion('b')<CR>",
        --                        mode = { "n", "o", "x" }
        --                }
        --        }},
        --{
        --        'MeanderingProgrammer/render-markdown.nvim',
        --        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        --        event = "VeryLazy",
        --        ---@module 'render-markdown'
        --        ---@type render.md.UserConfig
        --        opts = {},
        --},
        {
                "folke/which-key.nvim",
                -- 'default' for mappings similar to built-in completion
                -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
                -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
                -- See the full "keymap" documentation for information on defining your own keymap.
                keymap = { preset = 'default' },
                appearance = {
                        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                        -- Useful for when your theme doesn't support blink.cmp
                        -- Will be removed in a future release
                        use_nvim_cmp_as_default = true,
                        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                        -- Adjusts spacing to ensure icons are aligned
                        nerd_font_variant = 'mono'
                },
                -- Default list of enabled providers defined so that you can extend it
                -- elsewhere in your config, without redefining it, due to `opts_extend`
                sources = {
                        default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
        },
        {
                'saghen/blink.cmp',
                -- optional: provides snippets for the snippet source
                dependencies = 'rafamadriz/friendly-snippets',

                -- use a release tag to download pre-built binaries
                version = '*',
                -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
                -- build = 'cargo build --release',
                -- If you use nix, you can build from source using latest nightly rust with:
                -- build = 'nix run .#build-plugin',

                ---@module 'blink.cmp'
                ---@type blink.cmp.Config
                opts = {
                        -- 'default' for mappings similar to built-in completion
                        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
                        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
                        -- See the full "keymap" documentation for information on defining your own keymap.
                        keymap = { preset = 'super-tab',
                                ['<End>'] = { 'cancel', 'fallback' },
                                ['<C-j>'] = { 'select_next', 'fallback' },
                                ['<C-k>'] = { 'select_next', 'fallback' },
                        },

                        appearance = {
                                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                                -- Useful for when your theme doesn't support blink.cmp
                                -- Will be removed in a future release
                                use_nvim_cmp_as_default = true,
                                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                                -- Adjusts spacing to ensure icons are aligned
                                nerd_font_variant = 'mono'
                        },

                        -- Default list of enabled providers defined so that you can extend it
                        -- elsewhere in your config, without redefining it, due to `opts_extend`
                        sources = {
                                default = { 'lsp', 'path', 'snippets', 'buffer' },
                        },
                },
        },
        --{
        --        'ycdzj/win-mover.nvim',
        --        lazy = false,
        --        opts = {}, -- configuration goes here
        --},
        { "meznaric/key-analyzer.nvim", opts = {} },
})
