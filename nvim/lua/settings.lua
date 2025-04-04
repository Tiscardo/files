-- Global options
vim.opt.hlsearch = true -- highlight all search matches
vim.opt.incsearch = true -- search while you type
vim.opt.swapfile = false -- Disable Vim Swap file
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.cursorline = true -- highlight current line
vim.opt.mouse = "nv" -- Enable mouse in normal and visual modes
vim.opt.wildmenu = true
vim.opt.wildmode = { "list", "longest:full" } -- command-line completion mode
vim.opt.termguicolors = true -- truecolor support
vim.opt.clipboard = "unnamedplus" --using system clipboard
vim.opt.showmatch = true --highlight matching brackets
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = false
vim.opt.splitright = true -- open vsplit right
vim.opt.splitbelow = true -- open hsplit below
vim.opt.autochdir = true
vim.opt.autoindent = true
vim.opt.inccommand = "split" -- live preview of subsitute command

-- Title
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to

-- Disable comment "continuation"
vim.api.nvim_create_autocmd("BufEnter", { callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" }end,})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
    end
})
