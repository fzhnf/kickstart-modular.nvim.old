local M = {}

function M.delete_buffer()
  local bufnr = vim.fn.bufnr '%'
  local delete_cmd = 'bdelete'
  local excluded_filetypes = { 'alpha', 'startify', 'dashboard', 'neo-tree', 'toggleterm', 'lazygit', 'lazy', 'mason' }
  -- Check if the file type is in excluded file types, if so, don't delete
  if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
    return
  end
  if vim.bo.modified then
    local choice = vim.fn.confirm('Save changes to' .. vim.fn.bufname(bufnr) .. '?', '&Save\n&Quit\n&Cancel')
    if choice == 1 then
      vim.cmd 'silent !w'
    elseif choice == 2 then
      delete_cmd = delete_cmd .. '!'
    else
      return
    end
  end
  local ok, _ = pcall(vim.cmd, 'bprevious | ' .. delete_cmd .. '#')
  if not ok then
    vim.cmd(delete_cmd .. '|Alpha')
  end
end

function M.load_mappings(section, mapping_opts)
  mapping_opts = mapping_opts or {}
  local maps = require('mappings')[section]
  for _, map in ipairs(maps) do
    local mode = map[1]
    local lhs = map[2]
    local rhs = map[3]
    local opts = map[4] or {}
    for k, v in pairs(mapping_opts) do
      opts[k] = v
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return M
