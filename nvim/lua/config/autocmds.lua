---@diagnostic disable: deprecated
local autocmd = vim.api.nvim_create_autocmd
vim.cmd("autocmd!")
-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_fmt_group,
  callback = function()
    local efm = vim.lsp.get_active_clients({ name = "efm" })

    if vim.tbl_isempty(efm) then
      return
    end

    vim.lsp.buf.format({ name = "efm", async = true })
  end,
})
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_exec(
 	[[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
    au WinEnter,BufEnter,FileType Ex setlocal statusline=%!v:lua.Statusline.short()
    augroup END
  ]],
 	false
)
