local opt = vim.opt
local api = vim.api

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 0
opt.pumheight = 10
opt.pumwidth = 25
-- vim.opt.background = 'dark'
api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE', ctermbg = 'NONE' })
api.nvim_set_hl(0, 'LineNr', { fg = '#ffa500' })
api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { ctermfg = 'NONE', ctermbg = 'NONE' })
api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'none' })
api.nvim_set_hl(0, 'GitSignsChange', { bg = 'none' })
api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'none' })
