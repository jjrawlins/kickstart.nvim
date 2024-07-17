-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
-- Lspsaga
vim.keymap.set("n", "<Leader>Clt", "<Cmd>Lspsaga peek_type_definition<cr>", opts)
vim.keymap.set("n", "<Leader>Clg", "<Cmd>Lspsaga goto_definition<cr>", opts)
vim.keymap.set("n", "<Leader>Clc", "<Cmd>Lspsaga code_action<cr>", opts)
vim.keymap.set("n", "<Leader>Cld", "<Cmd>Lspsaga peek_definition<cr>", opts)
vim.keymap.set("n", "<Leader>Clf", "<Cmd>Lspsaga finder<cr>", opts)
vim.keymap.set("n", "<Leader>Clo", "<Cmd>Lspsaga outline<cr>", opts)
vim.keymap.set("n", "<Leader>Clr", "<Cmd>Lspsaga rename<cr>", opts)

-- Custom Code Actions
vim.keymap.set("n", "<Leader>Ctl", "<Cmd>EslintFixAll<cr>", opts)
