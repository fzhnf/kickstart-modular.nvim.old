return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
    {
      -- autopairs brackets
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
        -- If you want to automatically add `(` after selecting a function or method
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        local cmp = require 'cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end,
    },
  },
}
