-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors
vim.opt.termguicolors = true

-- clear vimrc autogroup
local api = vim.api
local vimrc_grp = api.nvim_create_augroup("vimrc", { clear = true })
api.nvim_clear_autocmds({ group = vimrc_grp })

-- set leader
vim.g.mapleader = " "

-- install and load plugins using lazy
require("pluggos")
require("config.nvim_cmp_conf")
require("config.lua_line_conf")
require("config.nvim_tree_conf")
require("config.telescope_conf")

-- load config files
