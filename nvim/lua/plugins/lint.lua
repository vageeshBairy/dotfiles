return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        javascript = { 'eslint_d' },
        json = { 'jsonlint' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        svelte = { 'eslint_d' },
        python = { 'pylint' },
        lua = { 'luacheck' },
        c = { 'cppcheck' },
        cpp = { 'cppcheck' },
        html = { 'markdownlint' },
        sql = { 'sqlfluff' },
        shell = { 'shellcheck' },
        text = { 'vale' },
        css = { 'stylelint' },
        scss = { 'stylelint' },
        yaml = { 'yamllint' },
      }
      lint.linters.luacheck = {
        cmd = 'luacheck',
        stdin = true,
        args = {
          '--globals',
          'vim',
          'lvim',
          'reload',
          '--',
        },
        stream = 'stdout',
        ignore_exitcode = true,
        parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
          source = 'luacheck',
        }),
      }
      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
