return {
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '╎',
        smart_indent_cap = true,
        priority = 2,
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'neo-tree',
          'lazy',
          'mason',
        },
      },
    },
  },
  { 'windwp/nvim-ts-autotag', opts = {}, event = 'InsertEnter' },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('configs.treesitter-setup')
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
