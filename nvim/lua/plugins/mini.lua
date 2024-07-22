---@diagnostic disable: undefined-global
return {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VimEnter',
  config = function()
    require('mini.ai').setup()

    require('mini.basics').setup {
      options = {
        extra_ui = true,
        win_borders = 'double',
      },
      mappings = {
        windows = true,
      },
    }

    require('mini.bracketed').setup()

    require('mini.bufremove').setup()

    require('mini.comment').setup()

    require('mini.clue').setup {
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        { mode = 'n', keys = '<Leader>f', desc = 'Find' },
        { mode = 'n', keys = '<Leader>l', desc = 'LSP' },
        { mode = 'n', keys = '<Leader>w', desc = 'Window' },
        { mode = 'n', keys = '<Leader>s', desc = 'Session' },
        { mode = 'n', keys = '<Leader>b', desc = 'Buffer' },
        { mode = 'n', keys = '<Leader>g', desc = 'Git' },
        { mode = 'n', keys = '<Leader>u', desc = 'UI' },
        { mode = 'n', keys = '<Leader>q', desc = 'NVim' },
        function()
          MiniClue.gen_clues.g()
        end,
        function()
          MiniClue.gen_clues.builtin_completion()
        end,
        function()
          MiniClue.gen_clues.marks()
        end,
        function()
          MiniClue.gen_clues.registers()
        end,
        function()
          MiniClue.gen_clues.windows()
        end,
        function()
          MiniClue.gen_clues.z()
        end,
      },
      window = {
        delay = 302,
      },
    }

    local mini_files = require 'mini.files'
    mini_files.setup = {
      windows = {
        preview = true,
      },
      vim.keymap.set('n', '<leader>fe', mini_files.open, { desc = 'open mini files' }),
    }

    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }

    require('mini.indentscope').setup {
      draw = {
        animation = function(s, n)
          return 7
        end,
      },
      symbol = '│',
    }

    require('mini.pairs').setup()

    require('mini.surround').setup()

    -- require('mini.tabline').setup()
  end,
}
