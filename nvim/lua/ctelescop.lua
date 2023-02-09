local builtin = require "telescope.builtin"

-- https://github.com/nvim-telescope/telescope.nvim#pickers for builtins
vim.keymap.set("n", "<c-p>f", builtin.find_files, {})
vim.keymap.set("n", "<c-p>g", builtin.live_grep, {})
vim.keymap.set("n", "<c-p>b", builtin.buffers, {})
vim.keymap.set("n", "<c-p>h", builtin.help_tags, {})
vim.keymap.set("n", "<c-p>t", builtin.treesitter, {})
