-- empty table to store functions that will be used many times in the config
local M = {}

-- function to add some behaviour for deleting buffers
function M.close_buffer()
  -- Check if the file type is in excluded file types, if so, don't delete
  if vim.tbl_contains({ 'alpha', 'startify', 'dashboard', 'neo-tree', 'toggleterm', 'lazygit', 'lazy', 'mason' }
      , vim.bo.filetype) then
    return
  end


  local bufnr = vim.fn.bufnr '%'
  local delete_cmd = 'bdelete'
  local w_cmd;

  if vim.bo.modified then
    local choice = vim.fn.confirm('Save changes to' .. vim.fn.bufname(bufnr) .. '?', '&Save\n&Quit\n&Cancel')

    if choice == 1 then
      w_cmd = 'silent up|'
    elseif choice == 2 then
      delete_cmd = delete_cmd .. '!'
    else
      return
    end
  end

  local bprevious = 'bprevious|' .. delete_cmd .. '#'
  if w_cmd then bprevious = w_cmd .. bprevious end

  local ok, _ = pcall(vim.cmd, bprevious)
  if not ok then
    local alpha = 'Alpha|' .. delete_cmd .. '#'
    if w_cmd then alpha = w_cmd .. alpha end
    vim.cmd(alpha)
  end
end

return M

-- vim: ts=2 sts=2 sw=2 et
