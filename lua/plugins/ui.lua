return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = { left = '/', right = '(' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha' },
      },
      extensions = { 'neo-tree', 'lazy' },
    },
  },

  --
  -- icons for plugins dependencies
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.startify'
      dashboard.section.header.val = {
        '                                                                   ',
        '   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⣠⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⢰⡀⢀⡆⠀⠀⠀⢀⡀⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ',
        '   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⣀⣠⠄⠸⡷⠄⢹⡧⠀⢀⡀⠀⠀⠍⠛⠀⣀⣤⠤⠖⢸⡷⠀⣿⠆⠀⢀⠀⢳⠀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀    ',
        '   ⠀⠀⠀⠀⠀⠀⠀⠀⠭⠛⢁⡠⠚⢉⠀⡖⡄⠀⢷⠀⠸⡇⠀⠀⠻⠀⠀⣠⠔⠋⢁⢠⢰⠀⠀⣧⠀⢸⡄⢠⠂⢀⢠⢠⠀⠴⡦⢸⡄⠀⡠⠁⠀⠷⡼⠁⠀⠀⠀⠀    ',
        '   ⠀⠀⠀⠀⢀⡀⡰⡆⠀⠀⠁⠀⠀⠀⠛⠛⠁⠀⢸⡆⠀⣷⠀⠀⠰⢄⠈⠁⠀⠀⠙⠞⠚⠀⠀⢻⠀⠸⡇⠺⠂⠸⡼⠾⠀⠁⠀⠘⣇⠀⣷⠂⠀⠀⣠⣄⡀⢸⣦⠀    ',
        '   ⠀⠀⠀⠀⠈⠿⠇⠀⠀⡀⠾⢿⠿⣷⣶⣀⣀⣀⢸⡇⠀⢸⡀⠀⠿⠏⢀⣾⡿⣿⣶⣶⣶⣆⣀⢸⡇⠀⣇⠀⢀⠀⠀⣆⠀⢾⡆⠀⣿⠀⠀⠀⠀⠰⠶⠉⠀⠀⣷⡀    ',
        '   ⠀⠀⡐⠁⠀⠀⢁⠀⡼⠛⣦⣤⣤⡶⠛⠋⠛⠉⠁⡇⠀⢸⡇⠀⣤⡀⠀⠻⢦⣀⣠⣼⠿⠛⠁⠸⡇⠀⢻⢀⣾⠃⠀⢻⡄⠘⣧⠀⢻⠀⠀⣤⡄⠀⠀⡠⠀⣀⠘⡧    ',
        '   ⠀⠀⡟⠁⠀⡠⠛⠁⣧⡀⠈⢉⠋⠐⠟⠀⠀⠀⢀⡇⡠⠈⡇⠀⠉⠁⣠⣴⢿⢿⣧⠐⠛⢀⠀⣠⠇⢠⢸⢸⢿⠀⠀⢸⣇⠀⢘⡆⢸⠂⣼⠀⠻⠶⠞⠻⠾⠛⠿⠃    ',
        '   ⢀⠌⠠⠐⢋⣴⠾⠛⠛⠛⢇⠃⠀⠀⠛⣡⣴⠾⠛⢱⡥⠀⠁⢀⣴⡾⢋⠀⠃⠀⠁⠈⣻⣷⠟⠋⢀⠈⢮⡾⡘⢷⣶⢯⠚⠛⠛⠀⣨⣤⣾⢷⣦⠀⠀⢀⡀⠰⢷⠀    ',
        '   ⠸⣦⣤⡴⠛⠁⣴⡴⢷⠀⢸⠀⢀⣠⡾⠋⢠⠃⢠⡀⢀⣠⣴⠟⠋⢠⡁⢸⠀⢀⣴⠟⠉⠀⠀⢠⣂⠀⠀⢀⡟⠃⠀⡆⠀⢀⣴⠞⠋⣰⠁⠀⣀⠔⠁⠁⣠⠴⠚⠋    ',
        '   ⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠁⠀⠀⠘⠃⠈⠛⠛⠉⠀⠀⠀⠘⠁⠈⠛⠛⠁⠀⠀⠀⠀⠈⠁⠀⠀⠓⠚⠀⠀⠘⠛⠋⠁⠀⠀⠛⠁⠀⠀⠀⠀⠐⠁⠀⠀⠀    ',
        '                                                                   ',
      }
      -- center the buttons
      dashboard.section.top_buttons.val = {
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      }
      dashboard.section.bottom_buttons.val = {
        dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
      }
      alpha.setup(dashboard.opts)
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        close_command = require('utils').close_buffer,
        offsets = {
          {
            filetype = 'neo-tree',
            text = function()
              return vim.fn.getcwd()
            end,
            text_align = 'left',
            highlight = 'Directory',
            separator = true,
          },
        },
        separator_style = 'thin',
        always_show_bufferline = true,
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
