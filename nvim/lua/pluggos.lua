#!/usr/bin/env lua

-- ░▒█▀▀█░█░░█░▒█░█▀▀▀░▀█▀░█▀▀▄░█▀▀
-- ░▒█▄▄█░█░░█░▒█░█░▀▄░▒█░░█░▒█░▀▀▄
-- ░▒█░░░░▀▀░░▀▀▀░▀▀▀▀░▄█▄░▀░░▀░▀▀▀


-- Install paq if not found
-- TODO: learn how to bootstrap paq


require "paq" {
-- **required**
	"savq/paq-nvim";


-- text editing
	"tpope/vim-surround";
	"tpope/vim-commentary";
	"junegunn/vim-easy-align";


-- project navigation
	"nvim-lua/plenary.nvim";
	{ "nvim-telescope/telescope.nvim", { tag = "0.1.1" }, requires = { "nvim-lua/plenary.nvim" } };
	{ "AckslD/nvim-neoclip.lua", requires = "nvim-telescope/telescope.nvim" };
	-- "nvim-telescope/telescope-file-browser.nvim";

	-- if I don't like telescope explorer...
	"nvim-tree/nvim-tree.lua";


-- completion
	"hrsh7th/nvim-cmp";
	"hrsh7th/cmp-nvim-lsp";
	"hrsh7th/cmp-buffer";
	"hrsh7th/cmp-path";
	"hrsh7th/cmp-cmdline";


-- quality of life
	"junegunn/vim-slash";
	"junegunn/vim-peekaboo";
	"tpope/vim-endwise";


-- syntx
	"frazrepo/vim-rainbow";
	"khaveesh/vim-fish-syntax";
	"euclidianAce/BetterLua.vim";
	"habamax/vim-godot";
	"neovim/nvim-lspconfig";
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	};


-- window decorX
	-- "vim-airline/vim-airline";
	-- "vim-airline/vim-airline-themes";
	 { "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true } };


-- pretty!
	"kyazdani42/nvim-web-devicons";
	"tomasr/molokai";
	"morhetz/gruvbox";
	"wojciechkepka/bogster";
}


