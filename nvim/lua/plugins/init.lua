
-- bootstrap lazy.nvim plz
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

require('lazy').setup({
	"folke/lazy.nvim",

	"morhetz/gruvbox",
	{ "catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},

	"nvim-tree/nvim-tree.lua",

	{ "vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
			{
				path = "~/Documents/Vimwiki/Journal/",
				syntax = "default",
				ext = ".wiki",
			},
		}
			vim.g.vimwiki_global_ext = 0
		end,
	},

	{ "numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},

	{ "kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},

	"monaqa/dial.nvim",

	"bullets-vim/bullets.vim",
	"johnfrankmorgan/whitespace.nvim",

	{ "nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{ "tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ "\"", mode = { "n", "v" } },
			{ "<C-R>", mode = "i" }
		},
		cmd = "Registers",
	},

	{ "nvim-telescope/telescope.nvim",
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{ "nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",

	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

})

vim.cmd.colorscheme("catppuccin-macchiato")

require("plugins.comment")
require("plugins.lualine")
require("plugins.nvim-cmp")
require("plugins.nvim-surround")
require("plugins.nvim-tree")
require("plugins.registers")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.whitespace")
require("plugins.dial")

require("plugins.lsp")
