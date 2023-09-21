-- clipboard
vim.opt.clipboard:append{ "unnamedplus" }

-- auto-update pwd on start
vim.opt.autochdir = true
vim.cmd("autocmd VimEnter * cd %:p:h")

-- numberline
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true

-- window
vim.opt.splitright = true

-- tabbing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
