return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvim-telescope/telescope.nvim',
    { 'folke/neodev.nvim' },
  },
  event = 'BufReadPre',
  config = function()
    local lspconfig = require 'lspconfig'
    local protocol = require 'vim.lsp.protocol'
    local _border = 'rounded'

    vim.diagnostic.config {
      float = { border = _border },
    }
    require('lspconfig.ui.windows').default_options = {
      border = _border,
    }
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    protocol.CompletionItemKind = {
      '', -- Text
      '', -- Method
      '', -- Function
      '', -- Constructor
      '', -- Field
      '', -- Variable
      '', -- Class
      'ﰮ', -- Interface
      '', -- Module
      '', -- Property
      '', -- Unit
      '', -- Value
      '', -- Enum
      '', -- Keyword
      '﬌', -- Snippet
      '', -- Color
      '', -- File
      '', -- Reference
      '', -- Folder
      '', -- EnumMember
      '', -- Constant
      '', -- Struct
      '', -- Event
      'ﬦ', -- Operator
      '', -- TypeParameter
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    local servers = {
      -- bash
      bashls = {},

      -- c/c++
      clangd = {
        on_attach = function(client, _)
          client.server_capabilities.signatureHelpProvider = false
        end,
      },

      -- css/scss
      cssls = {},

      -- html/js/ts/css
      emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
      },

      -- go
      gopls = {
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_dir = lspconfig.util.root_pattern('go.work', 'go.mod', '.git'),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      },

      -- graphql
      graphql = {
        filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
      },

      -- html
      html = {
        filetypes = { 'html' },
      },

      -- hprlang
      hyprls = {},

      -- java
      jdtls = {
        cmd = { 'jdtls' },
        root_dir = function(fname)
          return lspconfig.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
        end,
      },

      -- json
      jsonls = {},

      -- kotlin
      kotlin_language_server = {},

      -- lua
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Both',
            },
            diagnostics = {
              disable = { 'incomplete-signature-doc', 'missing-fields' },
              globals = { 'vim', 'MiniMap' },
            },
            hint = {
              enable = true,
              arrayIndex = 'Disable',
            },
            telemetry = { enable = false },
            chcekThirdParty = false,
            library = {
              vim.fn.expand '$VIMRUNTIME/lua',
              vim.fn.stdpath 'config' .. '/lua',
            },
          },
        },
      },

      -- prisma
      prismals = {},

      --python
      pyright = {},

      -- rust
      rust_analyzer = {
        filetypes = { 'rust' },
        root_dir = lspconfig.util.root_pattern 'Cargo.toml',
        cmd = {
          'rustup',
          'run',
          'stable',
          'rust-analyzer',
        },
      },

      -- sql
      sqls = {},

      -- svelte
      svelte = {
        capabilities = capabilities,
        on_attach = function(client, _)
          vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.js', '*.ts' },
            callback = function(ctx)
              if client.name == 'svelte' then
                client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.file })
              end
            end,
          })
        end,
      },

      -- tailwind css
      tailwindcss = {},

      -- toml
      taplo = {},

      --ts/tsx/js/jsx
      tsserver = {
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
      },

      -- vim
      vimls = {},

      -- vue
      vuels = {},

      -- yaml
      yamlls = {},
    }
    require('mason').setup {
      ui = {
        size = { width = 0.30, height = 0.30 },
        wrap = true, -- wrap the lines in the ui
        border = 'rounded',
        title = nil, ---@type string only works when border is not "none"
        title_pos = 'center', ---@type "center" | "left" | "right"
        pills = true, ---@type boolean
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'shfmt', -- shell script formatter
      'shellcheck', -- shell script linter
      'markdownlint', -- html linter
      'prettier', -- prettier formatter
      'stylelint', -- css, scss, sass lint
      'stylua', -- lua formatter
      'luacheck', -- lua linter
      'isort', -- python formatter
      'black', -- python formatter
      'ruff', -- python
      'mypy', -- python
      'pylint', -- python linter
      'eslint_d', -- js linter
      'gofumpt', -- go formatter
      'goimports-reviser', -- go import formatter
      'golines', -- go
      'clang-format', -- c. c++ formatter
      'cpplint', -- c, c++ linter
      'google-java-format', -- java formatter
      'ktlint', -- kotlin lint
      'ktfmt', -- kotlin formatter
      'codespell', -- spell check
      'sqlfmt', --sql formatter
      'sqlfluff', -- sql linter
      'vale', -- markdown, text linter
      'yamllint', -- yaml linter
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
