-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Source .bashrc to load aliases
vim.fn.system("source ~/.bashrc")
vim.api.nvim_command(
  "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('Neorg journal today') end, 0)"
)
