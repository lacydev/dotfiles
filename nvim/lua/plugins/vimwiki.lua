return {
	"vimwiki/vimwiki",
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
}
