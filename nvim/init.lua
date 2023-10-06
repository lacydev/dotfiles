-- disable netrw at the very start of your init.lua
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
require("plug.barb")
require("plug.buffline")
require("plug.colorz")
require("plug.comp")
require("plug.gcc")
require("plug.jb")
require("plug.line")
require("plug.surround")
require("plug.tele")
require("plug.term")
require("plug.tree")

-- load config files
require("appearance")
require("commands")
require("keymap")
require("options")



