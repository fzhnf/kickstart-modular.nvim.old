-- NOTE: This is where your plugins related to LSP can be installed.
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',       opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
    -- null-ls is a plugin that allows you to use LSP to do code formatting
    {
      'nvimtools/none-ls.nvim',
      config = function()
        local null_ls = require 'null-ls'
        local b = null_ls.builtins
        null_ls.setup {
          sources = {

            -- webdev stuff
            b.formatting.prettierd,

            -- Lua
            b.formatting.stylua,

            -- Python
            b.formatting.black,

            -- Rust
            b.formatting.rustfmt,

            -- cpp
            b.formatting.clang_format,

            -- go
            b.formatting.goimports_reviser,
            b.formatting.gofumpt,
            b.formatting.golines,
          },
        }
      end,
    },
  },
}
