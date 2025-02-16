require("settings")
require("plugins")
require("maps")
vim.cmd[[colorscheme everforest]]

require('mini.ai').setup()
require('mini.move').setup({
        down = '<A-j>',
        line_down = '<A-j>',
        up = '<A-k>',
        line_up = '<A-k>'
})
require('mini.comment').setup()
require('mini.files').setup({mappings = {close = '<End>'}})
require('leap').create_default_mappings()
--require("marks").setup()
require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        opts = {}
}
--require("spider").setup {
--        skipInsignificantPunctuation = true,
--        subwordMovement = false
--}
--require('render-markdown').setup({
--   render_modes = true 
--})
