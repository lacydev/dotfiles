#!/usr/bin/env lua

-- Install paq if not found
-- TODO: learn how to bootstrap paq


require "paq" {
-- **required**
	"savq/paq-nvim";


-- text editing
	"tpope/vim-surround";
	"tpope/vim-commentary";


-- quality of life
	"junegunn/vim-slash";
	"junegunn/vim-peekaboo";


-- syntx
	"frazrepo/vim-rainbow";
	"khaveesh/vim-fish-syntax"; 


-- window decorX
	-- "vim-airline/vim-airline";
	-- "vim-airline/vim-airline-themes";
	{ "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true } };


-- colors
	"tomasr/molokai";
	"morhetz/gruvbox";
	"wojciechkepka/bogster";

}


-- ░▒█▀▀█░█░░█░▒█░█▀▀▀░░▀░░█▀▀▄░░░▒█▀▀▀█░█▀▀░▀█▀░▀█▀░░▀░░█▀▀▄░█▀▀▀░█▀▀
-- ░▒█▄▄█░█░░█░▒█░█░▀▄░░█▀░█░▒█░░░░▀▀▀▄▄░█▀▀░░█░░░█░░░█▀░█░▒█░█░▀▄░▀▀▄
-- ░▒█░░░░▀▀░░▀▀▀░▀▀▀▀░▀▀▀░▀░░▀░░░▒█▄▄▄█░▀▀▀░░▀░░░▀░░▀▀▀░▀░░▀░▀▀▀▀░▀▀▀


-- colors
vim.cmd.colorscheme( "gruvbox" )


