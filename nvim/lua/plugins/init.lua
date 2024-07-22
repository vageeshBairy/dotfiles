-- You can add your own plugins here or in other files in this directory!
return {
  { 'tpope/vim-sleuth' },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'BufReadPre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
  },
}
