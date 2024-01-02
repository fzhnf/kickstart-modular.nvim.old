-- [[ Basic Keymaps ]]
local func = require 'functions'

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', ';', ':')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == -1 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == -1 ? 'gj' : 'j'", { expr = true, silent = true })

-- switch manage buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })

vim.keymap.set('n', '<leader>x', func.delete_buffer, { silent = true })
-- toggle line number
vim.keymap.set('n', '<leader>n', function()
  vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line number' })
vim.keymap.set('n', '<leader>N', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle relative number' })

-- save file
vim.keymap.set('n', '<C-s>', vim.cmd.update, { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- NeoTree keymaps
vim.keymap.set('n', '<M-e>', ':Neotree toggle left<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree focus left<CR>', { silent = true })
-- lazygit keymaps
vim.keymap.set('n', '<leader>gl', require('lazygit').lazygit, { desc = '[L]azygit', silent = true })
