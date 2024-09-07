-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when copying text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- only lint with ruff on python on save
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("RuffLintOnSave", { clear = true }),
  pattern = "*.py", -- This will apply to Python files only
  callback = function()
    vim.fn.jobstart("ruff check " .. vim.fn.expand("%:p"), {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          -- print("Ruff: No issues found")
        else
          print("Ruff: Issues found")
          -- vim.cmd("copen")
        end
      end,
      stdout_buffered = true,
      stderr_buffered = true,
    })
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("noxGroup", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
