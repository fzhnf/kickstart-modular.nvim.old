-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- enhanced tab scoping
  { 'tiagovla/scope.nvim',  opts = {} },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- coloscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
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
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',   opts = {} },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ':TSUpdate',
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  },

  {
    'ggandor/leap.nvim',
    event = 'BufRead',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
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

  { 'windwp/nvim-ts-autotag',  opts = {},     event = 'InsertEnter' },
  { 'akinsho/toggleterm.nvim', version = '*', opts = {} },
}
