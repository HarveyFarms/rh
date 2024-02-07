-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map Ctrl-j to ":normal o" in normal mode
vim.api.nvim_set_keymap("n", "<C-j>", ":normal o<CR>", { noremap = true, silent = true })

-- Map Ctrl-J to ":normal O" in normal mode
vim.api.nvim_set_keymap("n", "<C-k>", ":normal O<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-y>", "<Esc>:normal gcc<CR>", { noremap = true, silent = true })
