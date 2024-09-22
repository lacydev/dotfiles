------------------------------------------------------------------
-- Key Bindings [keymap]
------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>ve', ':$tabedit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vr', ':source $MYVIMRC<cr>')
vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')
vim.keymap.set('n', 'gf', '<cmd>edit <cfile><cr>')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('v', 'L', '$')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('n', '<C-h>', '<<')
vim.keymap.set('n', '<C-l>', '>>')
vim.keymap.set('v', '<C-h>', '<gv')
vim.keymap.set('v', '<C-l>', '>gv')
-- vim.keymap.set('i', '<C-h>', '<<')
-- vim.keymap.set('i', '<C-l>', '>>')
vim.keymap.set('n', '<F4>', '<cmd>noh<cr>', { silent = true })

-- For Lazy
vim.keymap.set('n', '<leader>ll', ':Lazy<cr>')
vim.keymap.set('n', '<leader>ls', ':Lazy sync<cr>')
