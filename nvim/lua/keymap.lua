-- console
vim.keymap.set('n', ';', ':', { desc = "Swap : with ; for ease of use" })
vim.keymap.set('n', ':', ';', { desc = "Swap ; with :" })


-- nav
vim.keymap.set('n', 'L', '$', { desc = "End of Line (Normal)" })
vim.keymap.set('n', 'H', '^', { desc = "Start of Line (Normal)" })
vim.keymap.set('v', 'L', '$', { desc = "End of Line (Visual)" })
vim.keymap.set('v', 'H', '^', { desc = "Start of Line (Visual)" })

vim.keymap.set('n', 'j', 'gj', { desc = "Move down, mimic common behavior" })
vim.keymap.set('n', 'k', 'gk', { desc = "Move up, mimic common behavior" })

vim.keymap.set('n', '<C-u>', 'zz<C-u>', { desc = "Center cursor on page up" })
vim.keymap.set('n', '<C-d>', 'zz<C-d>', { desc = "Center cursor on page down" })


-- redo
vim.keymap.set('n', 'U', '<C-r>', { desc = "Redo" })


-- window 
vim.keymap.set('n', '<Tab>', '<C-w>w', { desc = "Activate next pane" })
vim.keymap.set('n', '<S-Tab>', '<C-w>W', { desc = "Activate previous pane" })


-- tabs
vim.keymap.set('n', '<C-w><Tab>', ':$tabnew<cr>', { silent = true, desc = "Create new tab (with current file)" })

vim.keymap.set('n', '<C-Tab>', ':tabnext<CR>', { silent = true, desc = "Go to next tab" })
