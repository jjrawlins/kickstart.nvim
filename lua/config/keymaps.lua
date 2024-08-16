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
vim.keymap.set("n", "<C-Esc>", "<Cmd>Lspsaga close_floaterm<CR>", opts)

-- Custom Code Actions
vim.keymap.set("n", "<Leader>Ctl", "<Cmd>EslintFixAll<CR>", opts)

-- Custom Spelling Actions
vim.keymap.set("n", "<Leader>Si", "<Cmd>setlocal spell! spelllang=en_us<CR>", opts)
vim.keymap.set("n", "<Leader>Sn", "]s", { noremap = true, silent = true, desc = "Go to next misspelled word" })
vim.keymap.set("n", "<Leader>Sp", "[s", { noremap = true, silent = true, desc = "Go to previous misspelled word" })
vim.keymap.set("n", "<Leader>Sz", "z=", { noremap = true, silent = true, desc = "Open spelling suggestion list" })
vim.keymap.set("n", "<Leader>Sa", "zg", { noremap = true, silent = true, desc = "Add word to dictionary" })
vim.keymap.set("n", "<Leader>Sr", "zug", { noremap = true, silent = true, desc = "Remove word from dictionary" })

-- Remove copy paste issues
vim.opt.clipboard = { "unnamedplus" }
vim.keymap.set("n", "x", '"_dl', { desc = "Delete into black hole register" })
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line into black hole register" })
vim.keymap.set("n", "dW", '"_dW', { desc = "Delete WORD into black hole register" })
vim.keymap.set("n", "dG", '"_dG', { desc = "Delete to end of file into black hole register" })
-- Prevent overwriting clipboard when pasting in visual mode
-- vim.keymap.set("x", "p", '"_dP', { desc = "Paste without overwriting clipboard" })
-- Focus NeoTree
vim.keymap.set("n", "<Leader>nt", "<Cmd>Neotree reveal<cr>", opts)

vim.keymap.set("n", "<Leader>np", "<Cmd>Telescope neoclip<cr>", opts)

-- Set complete option  to menuone, noinsert, noselect
vim.o.completeopt = "menuone,noselect"

vim.api.nvim_set_keymap(
  "v",
  "<leader>sr",
  [[y:%s/<C-r>=escape(@", '/\')<CR>/g<left><left>]],
  { desc = "Search and replace current file", noremap = true, silent = true }
)
