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

	-- nvim-tree
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",

	-- colorscheme(s)
	"morhetz/gruvbox",

	-- nvim-cmp: completions engine
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",

  -- lsp made easy!
  "hrsh7th/cmp-nvim-lsp",
  "williamboman/nvim-lsp-installer",
  "neovim/nvim-lspconfig",

	-- snippets: quicker coding maybe!
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
			
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},

	-- gitgutter: git tracking
	"airblade/vim-gitgutter",

	-- lualine: status bar
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true }
	},

	-- nvim-visual-multi: multi-cursor with <c-n> in visual mode
	"mg979/vim-visual-multi",

	-- telescope: fuzzy finder for whatever!
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.3",
			dependencies = { "nvim-lua/plenary.nvim" }
	},
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter", },

	-- bufferline: a fancy tab bar type thing
	{"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},

	-- nvim-surround: change surrounding delimiters with ease!~
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},

	-- barbecue.nvim: `A VS Code like winbar for Neovim`
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},

	-- indent-blankline: visual indentation indication
	"lukas-reineke/indent-blankline.nvim",

	-- nvim-colorizer.lua: see them colors from the hex!
	"NvChad/nvim-colorizer.lua",

	-- toggleterm.nvim: turn on a terminal real quick
	{"akinsho/toggleterm.nvim", version = "*", config = true},

	-- Comment.nvim: for comments
	{ "numToStr/Comment.nvim", lazy = false },
})

