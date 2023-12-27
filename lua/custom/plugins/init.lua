-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
        neovim_image_text = '(◕ ̮ ◕)─✿❃',
        enable_line_number = false,
      }
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  { 'windwp/nvim-ts-autotag', opts = {} },

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
