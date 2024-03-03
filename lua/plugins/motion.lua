return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --  - va)  - [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jvgrootveld/telescope-zoxide',
      'nvim-telescope/telescope-ui-select.nvim',

      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require 'configs.telescope-setup'
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      window = {
        position = 'left',
        width = 30,
        mappings = {
          ['<space>'] = 'none',
        },
      },
    },
    config = function(_, opts)
      require('neo-tree').setup(opts)
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus left<CR>', { desc = 'focus file tree' })
      vim.keymap.set('n', '<M-e>', '<cmd>Neotree toggle left<CR>', { desc = 'Toggle file tree' })
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    opts = {},
    event = 'VeryLazy',
    config = function(_, opts)
      require('toggleterm').setup(opts)
      vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
      vim.keymap.set({ 't', 'n' }, '<C-[>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Open terminal below' })
      vim.keymap.set({ 't', 'n' }, '<C-]>', '<cmd>ToggleTerm direction=vertical size=40<cr>', { desc = 'Open terminal right' })
      vim.keymap.set({ 't', 'n' }, '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Open floating terminal' })
    end,
  },
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup {}

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
