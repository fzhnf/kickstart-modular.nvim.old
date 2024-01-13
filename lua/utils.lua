local M = {}

function M.delete_buffer()
  local bufnr = vim.fn.bufnr '%'
  local delete = 'bdelete'
  -- Check if the file type is "neo-tree"
  if vim.fn.getbufvar(bufnr, '&filetype') == 'neo-tree' then
    -- If the file type is "neo-tree," return nothing
    return
  end
  if vim.bo.modified then
    local choice = vim.fn.confirm('Save changes to' .. vim.fn.bufname(bufnr) .. '?', '&Save\n&Quit\n&Cancel')
    if choice == 1 then
      vim.cmd 'silent !w'
    elseif choice == 2 then
      delete = delete .. '!'
    else
      return
    end
  end
  local ok, _ = pcall(vim.cmd, 'bprevious | ' .. delete .. '#')
  if not ok then
    vim.cmd 'delete|Alpha'
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
