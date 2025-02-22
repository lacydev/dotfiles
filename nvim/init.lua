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

vim.cmd("filetype plugin indent on")

------------------------------------------------------------------
-- Included Files [require]
------------------------------------------------------------------

if vim.g.neovide then
	require("ginit")
end

require("keymap")
require("options")
require("commands")
require("myfiletype")

------------------------------------------------------------------
-- Plugins & Settings [plugins]
------------------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	defaults = {
		lazy = false,
		version = nil,
		cond = nil,
	},
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = {
		enabled = false,
	},

})



