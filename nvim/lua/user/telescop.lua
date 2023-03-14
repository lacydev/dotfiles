local builtin = require "telescope.builtin"

-- https://github.com/nvim-telescope/telescope.nvim#pickers for builtins
vim.keymap.set("n", "<c-f>", builtin.find_files, {})
vim.keymap.set("n", "<c-s>", builtin.live_grep,  {})
vim.keymap.set("n", "<c-b>", builtin.buffers,    {})
vim.keymap.set("n", "<F1>",  builtin.help_tags,  {})
vim.keymap.set("n", "<F2>",  builtin.treesitter, {})
