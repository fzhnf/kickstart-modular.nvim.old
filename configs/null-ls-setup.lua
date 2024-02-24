local null_ls = require 'null-ls'
local b = null_ls.builtins

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
        }
})
