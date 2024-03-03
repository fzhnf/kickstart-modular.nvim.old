local null_ls = require 'null-ls'
local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

require("null-ls").setup({
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
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
