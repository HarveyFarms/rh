-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Check if the NEONVIM environment variable is set to true
local neonvim_enabled = vim.fn.getenv("NEONVIM") == "true"

if neonvim_enabled then
  -- Run the commands specific to the shortcut launch
  vim.api.nvim_command(
    "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('Neorg workspace home') end, 0)"
  )
  vim.api.nvim_command(
    "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('Neorg journal today') end, 0)"
  )
  vim.api.nvim_command(
    "autocmd VimEnter * lua vim.defer_fn(function() vim.api.nvim_command('bdelete ~/rh/neorg/index.norg') end, 0)"
  )
end
