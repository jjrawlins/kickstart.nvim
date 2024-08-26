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
vim.keymap.set("i", "<c-p>", function()
  require("telescope.builtin").registers()
end, { remap = true, silent = false, desc = " and paste register in insert mode" })

vim.keymap.set("n", "<leader>yf", ":%y<cr>", { desc = "yank current file to the clipboard buffer" })
vim.keymap.set("n", "<leader>df", ":%d_<cr>", { desc = "delete file content to black hole register" })

-- Prevent overwriting clipboard when pasting in visual mode
-- vim.keymap.set("x", "p", '"_dP', { desc = "Paste without overwriting clipboard" })
-- Focus NeoTree
vim.keymap.set("n", "<Leader>nt", "<Cmd>Neotree reveal<cr>", opts)

vim.keymap.set("n", "<Leader>np", "<Cmd>Telescope neoclip<cr>", opts)

-- Set complete option  to menuone, noinsert, noselect
vim.o.completeopt = "menuone,noselect"

-- Search and Replace
vim.api.nvim_set_keymap(
  "v",
  "<leader>sra",
  [[y:%s/<C-r>=escape(@", '/\')<CR>/g<left><left>]],
  { desc = "Search and replace current file", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>srl", ":s/\\v", { desc = "search and replace on line" })
vim.keymap.set("n", "<leader>srf", ":%s/\\v", { desc = "search and replace in file" })

vim.keymap.set("n", "<leader>Tt", ":terminal<cr>", { desc = "Open Tab" })
vim.keymap.set("n", "<leader>pa", "ggVGp", { desc = "select all and paste" })
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "select all" })

vim.keymap.set("n", "<leader>gp", "`[v`]", { desc = "select pasted text" })

vim.keymap.set({ "n", "v" }, "<leader>gbf", ":GBrowse<cr>", { desc = "Git browse current file in browser" })

vim.keymap.set("n", "<leader>gbc", function()
  vim.cmd("GBrowse!")
end, { desc = "Copy URL to current file" })

vim.keymap.set("v", "<leader>gbl", ":GBrowse!<CR>", { desc = "Git browse current file and selected line in browser" })

--- Buffer Navigation
-- Custom buffer navigation
vim.keymap.set("n", "<C-S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "<C-S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })

-- Custom buffer navigation (insert mode)
vim.keymap.set(
  "i",
  "<C-S-h>",
  "<Esc><Esc>:bprevious<CR>",
  { noremap = true, silent = true, desc = "Go to previous buffer from insert mode" }
)
vim.keymap.set(
  "i",
  "<C-S-l>",
  "<Esc><Esc>:bnext<CR>",
  { noremap = true, silent = true, desc = "Go to next buffer from insert mode" }
)

-- Custom buffer navigation (terminal mode)
vim.keymap.set(
  "t",
  "<C-S-h>",
  [[<C-\><C-n>:bprevious<CR>]],
  { noremap = true, silent = true, desc = "Go to previous buffer from terminal mode" }
)
vim.keymap.set(
  "t",
  "<C-S-l>",
  [[<C-\><C-n>:bnext<CR>]],
  { noremap = true, silent = true, desc = "Go to next buffer from terminal mode" }
)

-- Toggle absolute line numbers
vim.keymap.set("n", "<leader>nn", ":set number!<CR>", { noremap = true, silent = true })

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>nr", ":set relativenumber!<CR>", { noremap = true, silent = true })
