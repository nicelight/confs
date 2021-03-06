silent !mkdir -p ~/.vim/undo
silent !mkdir -p ~/.vim/swap

set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent
set number              " line numbers
colorscheme desert
set nobackup            " get rid of anoying ~file
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set directory=$HOME/.vim/swap
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set mouse=a

set viminfo='100,\"500,:20,%,n~/.viminfo

set tabstop=4
set shiftwidth=4
set expandtab

set cursorline
set number
set hlsearch

:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <CR> :noh<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chr4/nginx.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-matchquote'
Plug 'tpope/vim-surround'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

set shell=fish
