-- [[ Setting options ]]
-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move to next/previous line
vim.opt.ww:append '<>[]hl'

-- indent
vim.opt.et = true
vim.opt.sw = 2
vim.opt.si = true
vim.opt.ts = 2
vim.opt.sts = 2

-- Set highlight on search
vim.o.hls = false

-- Make Hybrid line numbers default
vim.wo.nu = true
vim.wo.rnu = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.cb = 'unnamedplus'

-- Enable break indent
vim.o.bri = true

-- Save undo history
vim.o.udf = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ic = true
vim.o.scs = true

-- Keep signcolumn on by default
vim.wo.scl = 'yes'

-- Decrease update time
vim.o.ut = 250
vim.o.tm = 300

-- Set completeopt to have a better completion experience
vim.o.cot = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.tgc = true
