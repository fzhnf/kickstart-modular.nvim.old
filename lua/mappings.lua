-- [[ Basic Keymaps ]]
-- Keymaps for better default experience

local M = {}

M.general = {
  { { 'n', 'v' }, '<Space>', '<Nop>',                      { silent = true } },
  { 'n',          ';',       ':' },
  { { 'i', 'n' }, '<esc>',   '<cmd>noh<cr><esc>',          { desc = 'Escape and clear hlsearch' } },
  { 'v',          '<',       '<gv' },
  { 'v',          '>',       '>gv' },
  { 'n',          'k',       "v:count == -1 ? 'gk' : 'k'", { expr = true, silent = true } },
  { 'n',          'j',       "v:count == -1 ? 'gj' : 'j'", { expr = true, silent = true } },
  {
    'n',
    '<leader>n',
    function()
      vim.wo.number = not vim.wo.number
    end,
    { desc = 'Toggle line number' },
  },
  {
    'n',
    '<leader>N',
    function()
      vim.wo.relativenumber = not vim.wo.relativenumber
    end,
    { desc = 'Toggle relative number' },
  },
  { 'n',          '<C-s>',           vim.cmd.update,                                   { silent = true } },
  { 'n',          '<Tab>',           '<cmd>bnext<CR>',                                 { silent = true } },
  { 'n',          '<S-Tab>',         '<cmd>bprevious<CR>',                             { silent = true } },
  { 'n',          '<leader>x',       require('utils').delete_buffer,                   { desc = 'Delete buffer' } },
  { 'n',          '<leader><Tab>',   '<cmd>tabnext<CR>',                               { silent = true } },
  { 'n',          '<leader><S-Tab>', '<cmd>tabprevious<CR>',                           { silent = true } },
  { 'n',          '<C-w>t',          '<cmd>tabnew<CR>',                                { desc = 'create new tab', silent = true } },
  { { 'n', 'v' }, '[d',              vim.diagnostic.goto_prev,                         { desc = 'Go to previous diagnostic message' } },
  { { 'n', 'v' }, ']d',              vim.diagnostic.goto_next,                         { desc = 'Go to next diagnostic message' } },
  { 'n',          '<leader>q',       vim.diagnostic.open_float,                        { desc = 'Open floating diagnostic message' } },
  { 'n',          '<leader>Q',       vim.diagnostic.setloclist,                        { desc = 'Open diagnostics list' } },
  { 'n',          '<leader>e',       ':Neotree focus left<CR>',                        { silent = true } },
  { 'n',          '<M-e>',           ':Neotree toggle left<CR>',                       { silent = true } },
  { 'n',          '<leader>gl',      require('lazygit').lazygit,                       { desc = '[L]azygit', silent = true } },
  { 'n',          '<C-[>',           '<cmd>ToggleTerm direction=horizontal<CR>',       { desc = 'Open terminal horizontally', silent = true } },
  { 'n',          '<C-]>',           '<cmd>ToggleTerm direction=vertical size=40<CR>', { desc = 'Open terminal vertically', silent = true } },
  { 'n',          '<C-\\>',          '<cmd>ToggleTerm direction=float<CR>',            { desc = 'Open floating terminal ', silent = true } },
  { 't',          '<C-[>',           '<cmd>ToggleTerm direction=horizontal<CR>',       { desc = 'Open terminal horizontally', silent = true } },
  { 't',          '<C-]>',           '<cmd>ToggleTerm direction=vertical size=40<CR>', { desc = 'Open terminal vertically', silent = true } },
  { 't',          '<C-\\>',          '<cmd>ToggleTerm direction=float<CR>',            { desc = 'Open floating terminal', silent = true } },
  { 't',          '<C-w>h',          '<cmd>wincmd h<CR>',                              { silent = true } },
  { 't',          '<C-w>j',          '<cmd>wincmd j<CR>',                              { silent = true } },
  { 't',          '<C-w>k',          '<cmd>wincmd k<CR>',                              { silent = true } },
  { 't',          '<C-w>l',          '<cmd>wincmd l<CR>',                              { silent = true } },
}

local tlb = require 'telescope.builtin'
M.lsp = {
  { 'n', '<leader>rn', vim.lsp.buf.rename,                  { desc = '[R]e[n]ame' } },
  {
    'n',
    '<leader>ca',
    function()
      vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
    end,
    { desc = '[C]ode [A]ction' },
  },
  { 'n', 'gd',         tlb.lsp_definitions,                 { desc = '[G]oto [D]efinition' } },
  { 'n', 'gr',         tlb.lsp_references,                  { desc = '[G]oto [R]eferences' } },
  { 'n', 'gI',         tlb.lsp_implementations,             { desc = '[G]oto [I]mplementation' } },
  { 'n', '<leader>D',  tlb.lsp_type_definitions,            { desc = 'Type [D]efinition' } },
  { 'n', '<leader>ds', tlb.lsp_document_symbols,            { desc = '[D]ocument [S]ymbols' } },
  { 'n', '<leader>ws', tlb.lsp_dynamic_workspace_symbols,   { desc = '[W]orkspace [S]ymbols' } },
  { 'n', 'K',          vim.lsp.buf.hover,                   { desc = 'Hover Documentation' } },
  { 'n', '<C-k>',      vim.lsp.buf.signature_help,          { desc = 'Signature Documentation' } },
  { 'n', 'gD',         vim.lsp.buf.declaration,             { desc = '[G]oto [D]eclaration' } },
  { 'n', '<leader>wa', vim.lsp.buf.add_workspace_folder,    { desc = '[W]orkspace [A]dd Folder' } },
  { 'n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' } },
  {
    'n',
    '<leader>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    { desc = '[W]orkspace [L]ist Folders' },
  },
}
for i, map in ipairs(M.lsp) do
  if map[4]['desc'] then
    M.lsp[i][4]['desc'] = 'LSP: ' .. map[4]['desc']
  end
end

M.telescope = {
  { 'n', '<leader>?',       tlb.oldfiles, { desc = 'Find recently opened files' } },
  { 'n', '<leader><space>', tlb.buffers,  { desc = 'Find existing buffers' } },
  {
    'n',
    '<leader>/',
    function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      tlb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end,
    { desc = 'Fuzzily search in current buffer' },
  },
  { 'n', '<leader>sc', tlb.commands,                                { desc = 'Search Commands' } },
  {
    'n',
    '<leader>s/',
    function()
      tlb.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end,
    { desc = 'Search in Open Files' },
  },
  { 'n', '<leader>ss', tlb.builtin,                                 { desc = 'Search Select Telescope' } },
  { 'n', '<leader>gf', tlb.git_files,                               { desc = 'Search Git Files' } },
  { 'n', '<leader>sf', tlb.find_files,                              { desc = 'Search Files' } },
  { 'n', '<leader>sh', tlb.help_tags,                               { desc = 'Search Help' } },
  { 'n', '<leader>sw', tlb.grep_string,                             { desc = 'Search current Word' } },
  { 'n', '<leader>sg', tlb.live_grep,                               { desc = 'Search by Grep' } },
  { 'n', '<leader>sG', '<cmd>LiveGrepGitRoot<CR>',                  { desc = 'Search by Grep on Git Root' } },
  { 'n', '<leader>sd', tlb.diagnostics,                             { desc = 'Search Diagnostics' } },
  { 'n', '<leader>sr', tlb.resume,                                  { desc = 'Search Resume' } },
  { 'n', '<leader>sl', require('telescope').extensions.zoxide.list, { desc = 'Search Zoxide List' } },
}

local gs = require 'gitsigns'
M.gitsigns = {
  {
    { 'n',         'v' },
    ']c',
    function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end,
    { expr = true, desc = 'Jump to next hunk' },
  },
  {
    { 'n',         'v' },
    '[c',
    function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end,
    { expr = true, desc = 'Jump to previous hunk' },
  },
  {
    'v',
    '<leader>hs',
    function()
      gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end,
    { desc = 'Stage git hunk' },
  },
  {
    'v',
    '<leader>hr',
    function()
      gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end,
    { desc = 'Reset git hunk' },
  },
  { 'n', '<leader>hs', gs.stage_hunk,      { desc = 'git stage hunk' } },
  { 'n', '<leader>hr', gs.reset_hunk,      { desc = 'git reset hunk' } },
  { 'n', '<leader>hS', gs.stage_buffer,    { desc = 'git Stage buffer' } },
  { 'n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' } },
  { 'n', '<leader>hR', gs.reset_buffer,    { desc = 'git Reset buffer' } },
  { 'n', '<leader>hp', gs.preview_hunk,    { desc = 'preview git hunk' } },
  {
    'n',
    '<leader>hb',
    function()
      gs.blame_line { full = false }
    end,
    { desc = 'git blame line' },
  },
  { 'n',          '<leader>hd', gs.diffthis,                          { desc = 'git diff against index' } },
  {
    'n',
    '<leader>hD',
    function()
      gs.diffthis '~'
    end,
    { desc = 'git diff against last commit' },
  },
  { 'n',          '<leader>tb', gs.toggle_current_line_blame,         { desc = 'toggle git blame line' } },
  { 'n',          '<leader>td', gs.toggle_deleted,                    { desc = 'toggle git show deleted' } },
  { { 'o', 'x' }, 'ih',         '<cmd><C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' } },
}

return M
