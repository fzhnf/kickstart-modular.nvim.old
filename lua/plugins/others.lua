-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- coloscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    opts = {
      flavour = 'mocha',
      integration = {
        cmp = true,
        gitsigns = true,
        leap = true,
        mason = true,
        neotree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'BufRead',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
  },
  {
    'andweeb/presence.nvim',
    event = 'BufRead',
    config = function()
      require('presence').setup {
        main_image = 'neovim',
        neovim_image_text = '(◕ ̮ ◕)っ❃🌸💮🪷🌹🌺🌻🌼🌷🪻✿',
      }
    end,
  },
  { "tiagovla/scope.nvim" ,
    opts = {},
    config = function(_, opts)
      vim.opt.sessionoptions = {
          "buffers",
          "tabpages",
          "globals",
      }
      require("scope").setup(opts)
    end,
  },
  { 'LunarVim/bigfile.nvim', opts = {}, event = 'BufRead' },
}
