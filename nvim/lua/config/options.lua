local opt = vim.opt

-- file encoding
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- appearance
opt.laststatus = 3
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
opt.cmdheight = 0
opt.title = true
opt.syntax = 'ON'
opt.scrolloff = 10
opt.colorcolumn = '80'
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
opt.completeopt = 'menuone,noinsert,noselect'

-- tab & indentation
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false -- No Wrap lines
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true

-- search
opt.hlsearch = false
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.incsearch = true

-- behaviour
opt.autochdir = false
opt.backup = false
opt.shell = tostring(os.getenv 'SHELL')
opt.undofile = true
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.updatetime = 50
opt.swapfile = false
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.mouse:append 'a'
opt.clipboard = 'unnamedplus'
opt.modifiable = true
opt.fillchars = { eob = ' ' }
opt.backspace = 'indent,eol,start'
opt.iskeyword:append '-'
opt.guicursor = 'n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- folds
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99
