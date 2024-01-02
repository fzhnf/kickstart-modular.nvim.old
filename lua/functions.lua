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
      vim.cmd 'silent w'
    elseif choice == 2 then
      delete = delete .. '!'
    else
      return
    end
  end
  local ok, _ = pcall(vim.cmd, 'bprevious | ' .. delete .. '#')
  if not ok then
    vim.cmd(delete)
  end
end

return M
