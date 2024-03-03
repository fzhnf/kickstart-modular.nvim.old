return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<cr>', { desc = 'Open lazygit' })
    end,
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
