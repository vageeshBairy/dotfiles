vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 500
-- vim.opt.background = 'dark'
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE', ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffa500' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { ctermfg = 'NONE', ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'none' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = 'none' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'none' })
