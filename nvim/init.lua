--
-- ░▒█░░░░█▀▀▄░█▀▄░█░░█░░░▒█░░░░▄▀▀▄░▄░░░▄░█▀▀░█▀▀░░░█▀▀▄░▒█░░▒█░░▀░░█▀▄▀█
-- ░▒█░░░░█▄▄█░█░░░█▄▄█░░░▒█░░░░█░░█░░█▄█░░█▀▀░▀▀▄░░░█░▒█░░▒█▒█░░░█▀░█░▀░█
-- ░▒█▄▄█░▀░░▀░▀▀▀░▄▄▄▀░░░▒█▄▄█░░▀▀░░░░▀░░░▀▀▀░▀▀▀░░░▀░░▀░░░▀▄▀░░▀▀▀░▀░░▒▀
--
--					Neovim Config for Lacy

------------------------------------------------------------------
-- Initialization Processes [init]
------------------------------------------------------------------

-- best practice for nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

------------------------------------------------------------------
-- Key Bindings [keymap]
------------------------------------------------------------------

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ve', ':$tabedit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vr', ':source $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>ll', ':Lazy<cr>')
vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')
vim.keymap.set('n', 'gf', '<cmd>edit <cfile><cr>')
-- TODO make indentation keys available in Insert mode too
vim.keymap.set('v', '<C-h>', '<gv')
vim.keymap.set('v', '<C-l>', '>gv')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('v', 'L', '$')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('n', '<C-h>', '<<')
vim.keymap.set('n', '<C-l>', '>>')
vim.keymap.set('n', '<F4>', '<cmd>noh<cr>', { silent = true })

------------------------------------------------------------------
-- General Settings [options]
------------------------------------------------------------------

vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.hidden = true
vim.opt.autochdir = true
vim.opt.mouse = "a"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.list = true
vim.opt.listchars = { tab = "\\.", trail = "~" }
vim.opt.wrap = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.joinspaces = false

vim.opt.title = true
vim.opt.scrolloff = 16
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

------------------------------------------------------------------
-- Plugins & Settings [plugins]
------------------------------------------------------------------

vim.cmd("filetype plugin indent on")

require("plugins")

------------------------------------------------------------------
-- Commands [commands]
------------------------------------------------------------------

-- helptab
vim.api.nvim_create_user_command("HelpTabCheck",
	function()
		-- if vim.api.nvim_buf_get_option(0, 'buftype') == 'help' then
		if vim.api.nvim_get_option_value('buftype', {}) == 'help' then
			vim.cmd.wincmd("T")
			vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true })
			vim.keymap.set("n", "-", "<cmd>q<cr>", { buffer = true })
		end
	end,
{})

vim.api.nvim_create_augroup("help", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" },
{
	group = "help",
	pattern = "*.txt",
	command = "HelpTabCheck"
}
)
