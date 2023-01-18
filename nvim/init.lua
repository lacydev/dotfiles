-- clear vimrc autogroup
local api = vim.api
local vimrc_grp = api.nvim_create_augroup("vimrc", { clear = true })
api.nvim_clear_autocmds({ group = vimrc_grp })

-- install and load plugins
require('pluggos')

-- directly sourcing vimscript in modules (for now...)
vim.cmd.runtime { args = { "modules/*.vim" } , bang=true }

