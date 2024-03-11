-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_command(
  "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('Neorg workspace home') end, 0)"
)
vim.api.nvim_command(
  "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('Neorg journal today') end, 0)"
)
vim.api.nvim_command(
  "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('bdelete ~/rh/neorg/index.norg') end, 0)"
)
