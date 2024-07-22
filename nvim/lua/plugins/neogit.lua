return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  event = 'BufReadPre',
  config = function()
    local neogit = require 'neogit'
    neogit.setup()
    vim.keymap.set('n', '<leader>gs', neogit.open, { silent = true, noremap = true, desc = 'Open Neogit' })

    vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true, desc = 'Neogit Commit' })

    vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, noremap = true, desc = 'Neogit Pull' })

    vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, noremap = true, desc = 'Neogit Push' })

    vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true, desc = 'Git Branches' })

    vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true, desc = 'Git Blame' })
  end,
}
