-- console
vim.keymap.set('n', ';', ':', { desc = "Swap : with ; for ease of use" })
vim.keymap.set('v', ';', ':', { desc = "Swap : with ; for ease of use" })


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


-- tabs
vim.keymap.set('n', 'gT', ':$tabnew<cr>', { remap = false, silent = false, desc = "Create new tab (with current file)" })


-- indentation
vim.keymap.set('n', '<C-h>', '<<', { desc = "Decrease indentation" } )
vim.keymap.set('n', '<C-l>', '>>', { desc = "Increase indentation" } )
vim.keymap.set('v', '<C-h>', '<<gv', { desc = "Decrease indentation (Visual)" } )
vim.keymap.set('v', '<C-l>', '>>gv', { desc = "Increase indentation (Visual)" } )
