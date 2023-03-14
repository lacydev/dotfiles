" console access
nnoremap ; :
vnoremap ; :

" navigation
nnoremap L $
vnoremap L $
nnoremap H ^
vnoremap H ^

nnoremap j gj
nnoremap k gk

nnoremap <C-u> zz<C-u>
nnoremap <C-d> zz<C-d>

" redo
nnoremap U <C-r>

" O+o
nnoremap <Enter> O<CR>

" easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" split creation
nnoremap <C-w>z <C-w>s

" window navigation
nnoremap <S-Tab> <C-w>W
nnoremap <Tab> <C-w>w
nnoremap <silent> <C-w><Tab> :$tabnew<cr>

" tab/buffer navigation
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Up> :bprevious<CR>
nnoremap <silent> <C-Down> :bnext<CR>
