" nvim dotfile editing

" netrw
"command! Rc :Texplore ~/.dotfiles/nvim/ | tabmove

" nvim-tree
command! Rc :$tabnew | NvimTreeOpen ~/.dotfiles/nvim/


command! Reload :source $MYVIMRC
