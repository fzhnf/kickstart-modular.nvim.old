return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        require('utils').load_mappings('gitsigns', { buffer = bufnr })
      end,
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    event = 'VeryLazy',
  },
}
