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
vim.opt.tabstop = 2
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = false
vim.opt.splitright = true
vim.opt.autochdir = true
vim.opt.autoindent = true

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
