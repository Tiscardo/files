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
require("marks").setup()
require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        opts = {}
}
require("spider").setup {
        skipInsignificantPunctuation = true,
        subwordMovement = false
}
require'nvim-treesitter.configs'.setup {
  textobjects = {
select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'vv', -- linewise
        ['@class.outer'] = 'V', -- blockwise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
     },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["öm"] = "@function.outer",
        ["öö"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
        ["öo"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["ös"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
        ["öz"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["öM"] = "@function.outer",
        ["öÖ"] = "@class.outer",
      },
      goto_previous_start = {
        ["Öm"] = "@function.outer",
        ["ÖÖ"] = "@class.outer",
      },
      goto_previous_end = {
        ["ÖM"] = "@function.outer",
        ["Öö"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["öd"] = "@conditional.outer",
      },
      goto_previous = {
        ["Öd"] = "@conditional.outer",
      }
    },
  },
}
