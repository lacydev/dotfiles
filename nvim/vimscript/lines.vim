" list numbers
set number
set relativenumber

" i want to see everything
set list
set listchars+=trail:·,tab:»·

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" manual indenting
nnoremap <c-l> >>
nnoremap <c-h> <<
vmap <c-l> >gv
vmap <c-h> <gv
inoremap <c-l> <Esc>>>gi<Right>
inoremap <c-h> <Esc><<gi<Left>

" joining/separating lines
set nojoinspaces
nnoremap K i<CR><Esc>k$
