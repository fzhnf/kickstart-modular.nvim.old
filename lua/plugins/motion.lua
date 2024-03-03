return {
  {
    'ggandor/leap.nvim',
    event = 'BufRead',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jvgrootveld/telescope-zoxide',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require('configs.telescope-setup')
    end
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
      vim.keymap.set({ 't', 'n' }, '<C-[>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Open terminal below' })
      vim.keymap.set({ 't', 'n' }, '<C-]>', '<cmd>ToggleTerm direction=vertical size=40<cr>',
        { desc = 'Open terminal right' })
      vim.keymap.set({ 't', 'n' }, '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Open floating terminal' })
    end,
  },
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
}

-- vim: ts=2 sts=2 sw=2 et
