" Install vim-plug if not found
let s:vim_plug_file = expand(stdpath('config') . '/autoload/plug.vim')
if empty(glob(s:vim_plug_file))
	execute "silent !curl -fLo " . expand(s:vim_plug_file) . 
		\ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(stdpath('config') . '/plugged')


" **required**
Plug 'junegunn/vim-plug'


" text editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'


" quality of life
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-peekaboo'


" syntx
Plug 'frazrepo/vim-rainbow'
Plug 'khaveesh/vim-fish-syntax' 


" window decorX
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" colors
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'wojciechkepka/bogster'

call plug#end()


" ░▒█▀▀█░█░░█░▒█░█▀▀▀░░▀░░█▀▀▄░░░▒█▀▀▀█░█▀▀░▀█▀░▀█▀░░▀░░█▀▀▄░█▀▀▀░█▀▀
" ░▒█▄▄█░█░░█░▒█░█░▀▄░░█▀░█░▒█░░░░▀▀▀▄▄░█▀▀░░█░░░█░░░█▀░█░▒█░█░▀▄░▀▀▄
" ░▒█░░░░▀▀░░▀▀▀░▀▀▀▀░▀▀▀░▀░░▀░░░▒█▄▄▄█░▀▀▀░░▀░░░▀░░▀▀▀░▀░░▀░▀▀▀▀░▀▀▀

" colors
colorscheme gruvbox


" vim-airline
let g:airline#airline_theme = "monokai"
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'

" let g:airline_powerline_fonts = 1
