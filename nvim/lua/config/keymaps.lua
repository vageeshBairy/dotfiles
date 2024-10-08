local discipline = require 'config.discipline'
local map = vim.keymap.set
local nmap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- increment/decrement 1
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- select all
map('n', '<C-a>', 'gg<S-v>G', opts)

-- delete a word backwards
map('n', 'db', 'vbd')

-- file explorer
opts.desc = 'Open file explorer'
map('n', '<leader>-', '<cmd>Oil --float<CR>', opts)

-- no highlights
opts.desc = 'clear search highlights'
map('n', '<leader>nh', ':nohl<CR>', opts)

-- bufer management keybindings
map('n', '<tab>', ':bnext<CR>', opts)
map('n', '<S-tab>', ':bprevious<CR>', opts)
map('n', 'bc', ':bdelete<CR>', opts)

-- split keybindings
opts.desc = 'horizontal split'
map('n', 'sp', ':split<Return>', opts)
opts.desc = 'vertical split'
map('n', 'sv', ':vsplit<Return>', opts)
opts.desc = 'equal split'
map('n', 'sx', '<cmd>close<CR>', opts)

-- Pane and window navigation
opts.desc = 'Navigate Left'
map('n', '<C-h>', '<C-w>h', opts) -- Navigate Left
opts.desc = 'Navigate Down'
map('n', '<C-j>', '<C-w>j', opts) -- Navigate Down
opts.desc = 'Navigate Up'
map('n', '<C-k>', '<C-w>k', opts) -- Navigate Up
opts.desc = 'Navigate Right'
map('n', '<C-l>', '<C-w>l', opts) -- Navigate Right

map('n', '<C-w><left>', '<C-w><', opts) -- Resize Left
map('n', '<C-w><right>', '<C-w>>', opts) -- Resize Right
map('n', '<C-w><up>', '<C-w>+', opts) -- Resize up
map('n', '<C-w><down>', '<C-w>-', opts) -- Resize down

-- move selected section up/dowm
map('v', 'J', ":m '>+1<cr>gv=gv", opts)
map('v', 'K', ":m '<-2<cr>gv=gv", opts)

-- movement keybindings
map('n', 'J', 'mzJ`z', opts)
map('n', '<C-d>', '<c-d>zz', opts)
map('n', '<C-u>', '<c-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'n', 'nzzzv', opts)

-- this is going to get me cancelled
map('n', 'Q', '<nop>', opts)

-- open tmux sessionizer
opts.desc = 'open tmux sessionizer'
map('n', '<C-f>', '<cmd>!tmux neww tmux_sessionizer<CR>', opts)

opts.desc = 'format code'
map('n', '<leader>fx', vim.lsp.buf.format, opts)

opts.desc = 'search and replace'
map('n', '<leader>ss', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = false })

opts.desc = 'make shell script executable'
map('n', '<leader>cx', '<cmd>!chmod +x %<CR>', { noremap = true, silent = false })

-- indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

--commenting/uncommenting
nmap('n', '<C-/>', 'gcc', { noremap = false, silent = false })
nmap('v', '<C-/>', 'gcc', { noremap = false, silent = false })

-- same commenting keybindings for tmux session
nmap('n', '<C-_>', 'gcc', { noremap = false, silent = false })
nmap('v', '<C-_>', 'gcc', { noremap = false, silent = false })

-- misc
nmap('n', 'QQ', ':q!<enter>', opts)
nmap('n', '<C-s>', ':w!<enter>', opts)
nmap('n', 'E', '$', opts)
nmap('n', 'B', '^', opts)

discipline.cowboy()
