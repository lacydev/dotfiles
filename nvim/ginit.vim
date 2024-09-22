if exists('g:fvim_loaded')
	" good old 'set guifont' compatibility with HiDPI hints...
	if g:fvim_os == 'windows' || g:fvim_render_scale > 1.0
		set guifont=RobotoMono\ Nerd\ Font\ Mono:h14
	else
		set guifont=RobotoMono\ Nerd\ Font\ Mono:h28
	endif

	FVimCursorSmoothMove v:true
	FVimCursorSmoothBlink v:true

	" Ctrl-ScrollWheel for zooming in/out
	nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
	nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
	nnoremap <A-CR> :FVimToggleFullScreen<CR>
	nnoremap <F11> :FVimToggleFullScreen<CR>
endif
