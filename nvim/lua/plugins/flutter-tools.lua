return {
  'akinsho/flutter-tools.nvim',
  lazy = true,
  event = 'FileType',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
    'mfussenegger/nvim-dap',
  },

  config = function()
    require('flutter-tools').setup {
      flutter_path = '/home/bairy/Android/flutter/bin/flutter', -- this takes priority over the lookup
      root_patterns = { '.git', 'pubspec.yaml' },
      ui = {
        border = 'rounded',
        notification_style = 'plugin',
      },
      debugger = {
        enabled = true,
        register_configurations = function(_)
          require('dap').configurations.dart = {}
          require('dap.ext.vscode').load_launchjs()
        end,
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = 'ErrorMsg', -- highlight for the closing tag
        prefix = '>', -- character to use for close tag e.g. > Widget
        enabled = true, -- set to false to disable
      },
      dev_log = {
        enabled = true,
        open_cmd = 'tabedit', -- command to use to open the log buffer
      },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      outline = {
        open_cmd = '30vnew', -- command to use to open the outline buffer
        auto_open = false, -- if true this will open the outline automatically when it is first populated
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = true, -- highlight the background
          foreground = true, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = '■', -- the virtual text character to highlight
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = vim.fn.expand '$HOME/.pub-cache',
          renameFilesWithClasses = 'prompt', -- "always"
          enableSnippets = true,
        },
      },
    }
  end,
}
