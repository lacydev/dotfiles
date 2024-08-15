" list of wikis
let g:vimwiki_list = [
	\	{ 'path': '~/Documents/Vimwiki/Journal/',
	\	'syntax': 'default',
	\	'ext': ".wiki",
	\	},
	\ ]

" vimwiki only works on vimwiki buffers, not all markdown
let g:vimwiki_global_ext = 0
