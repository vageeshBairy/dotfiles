---@diagnostic disable: deprecated, assign-type-mismatch
local modes = {
  ['n'] = 'NOR',
  ['no'] = 'NOR',
  ['v'] = 'VIS',
  ['V'] = 'VIS L',
  [''] = 'VIS B',
  ['s'] = 'SEL',
  ['S'] = 'SEL L',
  [''] = 'SEL B',
  ['i'] = 'INS',
  ['ic'] = 'IN',
  ['R'] = 'REP',
  ['Rv'] = 'VIS R',
  ['c'] = 'COM',
  ['cv'] = 'VIM E',
  ['ce'] = 'EXP',
  ['r'] = 'PRO',
  ['rm'] = 'MOAR',
  ['r?'] = 'CON',
  ['!'] = 'SHL',
  ['t'] = 'TER',
}

local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format('  %s ', modes[current_mode]):upper()
end

local function filename()
  local fname = vim.fn.expand '%:t'
  if fname == '' then
    return '' .. '%#Normal#'
  end
  return '  ' .. fname .. ' '
end

local function git()
  if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
    return '' .. '%#Normal#'
  end

  local git_status = vim.b[stbufnr()].gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ('  ' .. git_status.added) or ''
  local changed = (git_status.changed and git_status.changed ~= 0) and ('  ' .. git_status.changed) or ''
  local removed = (git_status.removed and git_status.removed ~= 0) and ('  ' .. git_status.removed) or ''
  local branch_name = '  ' .. git_status.head

  return '%#St_gitIcons#' .. branch_name .. added .. changed .. removed
end

local function lsp()
  local count = {}
  local levels = {
    errors = 'Error',
    warnings = 'Warn',
    info = 'Info',
    hints = 'Hint',
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ''
  local warnings = ''
  local hints = ''
  local info = ''

  if count['errors'] ~= 0 then
    errors = '%#LspDiagnosticsSignError#  ' .. count['errors']
  end
  if count['warnings'] ~= 0 then
    warnings = '%#LspDiagnosticsSignWarning#  ' .. count['warnings']
  end
  if count['hints'] ~= 0 then
    hints = '%#LspDiagnosticsSignHint# ' .. count['hints']
  end
  if count['info'] ~= 0 then
    info = '%#LspDiagnosticsSignInformation# 󰋼' .. count['info']
  end

  return errors .. warnings .. hints .. info .. ' '
end

-- LSP clients attached to buffer
local function clients_lsp()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_active_clients { bufnr = bufnr }
  if next(clients) == nil then
    return ' ' .. '%#Normal#'
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return '  ' .. c[1] .. ' '
end

local function filetype()
  local ft = vim.bo.filetype
  if ft == nil then
    return '' .. '%#Normal#'
  end
  return string.format('  %s ', ft)
end

local function lineinfo()
  if vim.bo.filetype == 'alpha' then
    return ' ' .. '%#Normal#'
  end
  return ' 󰉸 %l:%c '
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    '%#StatusLine#',
    mode(),
    '%#StatusLine#',
    git(),
    '%#StatusLine#',
    '%=%#Visual#',
    '%#MsgSeperator#',
    filename(),
    '%=%#Visual#',
    '%#MsgSeperator#',
    lsp(),
    '%#StatusLine#',
    clients_lsp(),
    '%#StatusLine#',
    filetype(),
    '%#StatusLine#',
    lineinfo(),
  }
end

function Statusline.inactive()
  return ' %F'
end

function Statusline.short()
  return '   Explorer'
end
