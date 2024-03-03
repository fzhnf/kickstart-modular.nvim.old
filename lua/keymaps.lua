-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- changing the default keymaps behavior to make it more intuitive
vim.keymap.set('n', ';', ':')
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- toggle numbers
vim.keymap.set('n', '<leader>n', function()
  vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line numbers' })
vim.keymap.set('n', '<leader>N', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle relative line numbers' })

-- save the file
vim.keymap.set('n', '<C-s>', vim.cmd.update)

-- tab & window
vim.keymap.set('n', '<C-w>h', '<cmd>wincmd h<cr>', { desc = 'Move to the window on the left' })
vim.keymap.set('n', '<C-w>j', '<cmd>wincmd j<cr>', { desc = 'Move to the window below' })
vim.keymap.set('n', '<C-w>k', '<cmd>wincmd k<cr>', { desc = 'Move to the window above' })
vim.keymap.set('n', '<C-w>l', '<cmd>wincmd l<cr>', { desc = 'Move to the window on the right' })
vim.keymap.set('n', '<C-w>q', vim.cmd.close, { desc = 'Close the current window' })
vim.keymap.set('n', '<C-w><Tab>', vim.cmd.tabnew, { desc = 'Open a new tab' })
vim.keymap.set('n', '<leader><Tab>', vim.cmd.tabnext, { desc = 'Move to the next tab' })
vim.keymap.set('n', '<leader><S-Tab>', vim.cmd.tabprevious, { desc = 'Move to the previous tab' })

-- buffer
vim.keymap.set('n', '<leader>x', require('utils').close_buffer, { desc = 'Close the current buffer' })
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Move to the next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Move to the previous buffer' })

-- vim: ts=2 sts=2 sw=2 et
