-- empty table to store functions that will be used many times in the config
local M = {}

-- function to add some behaviour for deleting buffers
function M.close_buffer()
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
  local ok, _ = pcall(vim.cmd, 'bprevious|' .. delete_cmd .. '#')
  if not ok then vim.cmd('Alpha|' .. delete_cmd .. '#') end
end

return M
