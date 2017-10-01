#!/bin/bash
mkdir ~/.vim/
mkdir ~/.vim/swap
mkdir ~/.vim/undo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
