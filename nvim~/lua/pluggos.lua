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

	-- lsp made easy (with lsp-zero.nvim)
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- completion sources and snippets
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",

	-- gitgutter: git tracking
	"airblade/vim-gitgutter",

	-- lualine: status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
	},
	
	-- telescope: fuzzy finder for whatever!
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.3",
			dependencies = { "nvim-lua/plenary.nvim" }
	},
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

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

	-- nvim-colorizer" see them colors from the hex!
	"NvChad/nvim-colorizer.lua",

	-- toggleterm.nvim: turn on a terminal real quick
	{"akinsho/toggleterm.nvim", version = "*", config = true},

	-- Comment.nvim: for comments
	{ "numToStr/Comment.nvim", lazy = false },

  -- registers.nvim: check out the registers
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
      { "\"",	 mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    cmd = "Registers",
  },

	-- neoscroll: prettier scrolling
	"karb94/neoscroll.nvim",

	-- mini.pairs: minimal pairing system
	{ "echasnovski/mini.pairs", version = false },

	-- flit.nvim: flit around with f/F;t/T
	{	"ggandor/flit.nvim", dependencies = {
		"ggandor/leap.nvim",
		"tpope/vim-repeat",
		},
	},
	"ggandor/leap.nvim",
	"tpope/vim-repeat",


})

