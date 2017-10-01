set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set number              " line numbers
colorscheme desert      " colorscheme desert
set nobackup            " get rid of anoying ~file
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set directory=~/.vim/swap
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set viminfo='100,\"500,:20,%,n~/.vim/viminfo

set tabstop=4
set expandtab

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'

call plug#end()
