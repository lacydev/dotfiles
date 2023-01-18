" clear vimrc autogroup
augroup vimrc
	autocmd!
augroup END

" set current working directory
execute "lcd" . expand(stdpath('config'))

" load plugins
if filereadable(expand("pluggos.vim"))
	source pluggos.vim
endif

" load modules
runtime! modules/*.vim
