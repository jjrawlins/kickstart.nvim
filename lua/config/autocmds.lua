-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("eslint_lsp"),
  pattern = "*.js,*.ts,*.jsx,*.tsx",
  callback = function()
    vim.api.nvim_command("EslintFixAll")
  end,
})

-- Remove carriage return from yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.v.event.operator == "y" and vim.v.event.regtype == "V" then
      local content = vim.fn.getreg(vim.v.event.regname)
      content = content:gsub("\n$", "")
      vim.fn.setreg(vim.v.event.regname, content)
    end
  end,
})
