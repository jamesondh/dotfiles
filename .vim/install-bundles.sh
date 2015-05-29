#!/bin/bash

if [ ! -d ~/.dotfiles/.vim/bundle/auto-pairs ]; then
    git clone https://github.com/jiangmiao/auto-pairs ~/.dotfiles/.vim/bundle/auto-pairs
fi

if [ ! -d ~/.dotfiles/.vim/bundle/nerdtree ]; then
    git clone https://github.com/scrooloose/nerdtree ~/.dotfiles/.vim/bundle/nerdtree
fi
