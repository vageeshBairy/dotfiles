return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
  event = { 'VeryLazy' },
  config = true,
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Open/close trouble list' },
    { '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Open trouble workspace diagnostics' },
    { '<leader>xd', '<cmd>Trouble lsp_document_symbols toggle<CR>', desc = 'Open trouble document diagnostics' },
    { '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', desc = 'Open trouble quickfix list' },
    { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Open trouble location list' },
    { '<leader>xt', '<cmd>TodoTrouble toggle<CR>', desc = 'Open todos in trouble' },
  },
}
