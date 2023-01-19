-- clear vimrc autogroup
local api = vim.api
local vimrc_grp = api.nvim_create_augroup("vimrc", { clear = true })
api.nvim_clear_autocmds({ group = vimrc_grp })

-- install and load plugins (sticking with vim-plug for now; interest in paq)
require('pluggos')
require('lualine-config')
-- vim.cmd.source { args = { "./pluggos.vim" }

-- directly sourcing vimscript in modules (for now...)
vim.cmd.runtime { args = { "vimscript/*.vim" } , bang=true }

