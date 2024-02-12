-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.opt.formatoptions:remove({ "r", "o", "c" })

vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter * if &nu | setlocal nu | endif
    autocmd BufEnter * if &rnu | setlocal rnu | endif
  augroup END
]])
