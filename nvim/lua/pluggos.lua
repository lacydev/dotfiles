local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
				vim.fn.system({
								"git",
								"clone",
								"--filter=blob:none",
								"https://github.com/folke/lazy.nvim.git",
								"--branch=stable", -- latest stable release
								lazypath,
				})
end
vim.opt.rtp:prepend(lazypath)

-- plugins

require("lazy").setup({
	-- lazy: plugin manager

	"folke/lazy.nvim",

	-- alpha: start screen

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function ()
			require("alpha").setup(require("alpha.themes.startify").config)
		end
	},

	-- nvim-cmp: completions engine

	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	-- gitgutter: git tracking
		
	"airblade/vim-gitgutter",

	-- lualine: status bar
	
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true }
	},

	-- nvim-visual-multi: multi-cursor with <c-n> in visual mode
	
	"mg979/vim-visual-multi",

	-- nvim-tree: file explorer
	
	"nvim-tree/nvim-tree.lua",

	-- telescope: fuzzy finder for whatever!
	
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.3",
			dependencies = { "nvim-lua/plenary.nvim" }
	},
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

})
