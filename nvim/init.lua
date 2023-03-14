-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicikirs
vim.opt.termguicolors = true

-- clear vimrc autogroup
local api = vim.api
local vimrc_grp = api.nvim_create_augroup("vimrc", { clear = true })
api.nvim_clear_autocmds({ group = vimrc_grp })

-- set leader
vim.g.mapleader = " "

-- install and load plugins
--vim.cmd.source { args = { "./pluggos.vim" }
require "appearance"
require "pluggos"

require "user.lualine"
require "user.ncmp"
require "user.neoclip"
require "user.telescop"
require "user.ntree"
require "user.treesitters"

-- lsp
require "lspconfig".gdscript.setup{}

-- directly sourcing vimscript in modules (for now...)
vim.cmd.runtime { args = { "vimscript/*.vim" } , bang=true }

