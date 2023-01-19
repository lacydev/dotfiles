function! s:HelpTab()
	if &buftype == 'help'
		wincmd T
		nnoremap <buffer> q :q<cr>
	endif
endfunction

augroup helptabbing
	autocmd vimrc BufEnter *.txt call s:HelpTab() | tabmove
augroup END
