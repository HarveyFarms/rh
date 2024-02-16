-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "itchyny/calendar.vim",
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    -- amongst your other plugins
    { "akinsho/toggleterm.nvim", version = "*", config = true },
  },
  {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    ft = "norg",
    cmd = "Neorg",
    priority = 30,
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                home = "~/rh/neorg",
                school = "~/cc",
              },
            },
          },
          ["core.journal"] = {
            config = {
              journal_folder = "journal",
            },
          },
          ["core.concealer"] = {
            config = {
              folds = true,
              icon_present = "varied",
            },
          },

          ["core.tempus"] = { config = {} },
          ["core.ui.calendar"] = { config = {} },
          ["core.export"] = { config = {} },
          ["core.export.markdown"] = { config = {} },
          ["core.manoeuvre"] = { config = {} },
          ["core.summary"] = { config = {} },
          ["core.autocommands"] = { config = {} },
          ["core.clipboard"] = { config = {} },
          ["core.dirman.utils"] = { config = {} },
          ["core.fs"] = { config = {} },
          ["core.highlights"] = { config = {} },
          ["core.integrations.treesitter"] = { config = {} },
          ["core.mode"] = { config = {} },
          ["core.neorgcmd"] = { config = {} },
          ["core.neorgcmd.commands.return"] = { config = {} },
          ["core.queries.native"] = { config = {} },
          ["core.scanner"] = { config = {} },
          ["core.storage"] = { config = {} },
          ["core.syntax"] = { config = {} },
          ["core.ui"] = { config = {} },
        },
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>j",
        function()
          require("harpoon"):list():append()
        end,
        desc = "harpoon file",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<C-N>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "harpoon next",
      },
      {
        "<C-P>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "harpoon previous",
      },
    },
  },
}
