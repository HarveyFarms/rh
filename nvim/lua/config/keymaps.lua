-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Map Ctrl-j to ":normal o" in normal mode
vim.api.nvim_set_keymap("n", "<C-j>", ":normal o<CR>", { noremap = true, silent = true })

-- Map Ctrl-J to ":normal O" in normal mode
vim.api.nvim_set_keymap("n", "<C-k>", ":normal O<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":b#<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-y>", "<Esc>:normal gcc<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>fj",
  ":Neorg workspace home<CR>:Neorg journal today<CR>",
  { noremap = true, silent = true }
)

-- for workspaces in neorg
vim.api.nvim_set_keymap("n", "<leader>wh", ":Neorg workspace home<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ws", ":Neorg workspace school<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fq", ":Calendar -view=month<CR>", { noremap = true, silent = true })
