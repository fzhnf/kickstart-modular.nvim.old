return {
  -- null-ls is a plugin that allows you to use LSP to do code formatting
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
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
        },
      }
    end,
  },
}
