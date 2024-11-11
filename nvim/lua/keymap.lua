------------------------------------------------------------------
-- Key Bindings [keymap]
------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ease of use
vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')
vim.keymap.set('n', 'gf', '<cmd>edit <cfile><cr>')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('v', 'L', '$')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- indentation
vim.keymap.set('n', '<C-l>', '>>')
vim.keymap.set('n', '<C-h>', '<<')
vim.keymap.set('v', '<C-l>', '>gv')
vim.keymap.set('v', '<C-h>', '<gv')
vim.keymap.set('i', '<C-l>', '<C-t>')
vim.keymap.set('i', '<C-h>', '<C-d>')
-- functional
vim.keymap.set('n', '<F4>', '<cmd>noh<cr>', { silent = true })

-- init.lua edit
vim.keymap.set('n', '<leader>ve', ':$tabedit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vr', ':source $MYVIMRC<cr>')

-- For Lazy
vim.keymap.set('n', '<leader>ll', ':Lazy<cr>')
vim.keymap.set('n', '<leader>ls', ':Lazy sync<cr>')
