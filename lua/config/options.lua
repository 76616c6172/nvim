-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.cursorline = false

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 0
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = false
    vim.opt.guifont = "MononokiNerdFontMono-Regular"
  end,
})
