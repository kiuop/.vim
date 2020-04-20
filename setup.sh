#!/bin/sh

sudo apt install exuberant-ctags
mkdir -p bundle
git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
ln -s `pwd`/vimrc ~/.vimrc
