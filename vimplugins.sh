#!/bin/bash

DOTFILES=`pwd`

mkdir -p ${DOTFILES}/symlink/.vim/plugin

# Auto match ({[]}) etc.
# https://github.com/jiangmiao/auto-pairs
echo -e "\e[1m\e[93m---> Downloading vim:auto-pairs\e[0m"
echo "let g:AutoPairsFlyMode = 1" > ${DOTFILES}/symlink/.vim/plugin/auto-pairs.vim # Enable fly mode
curl https://raw.githubusercontent.com/jiangmiao/auto-pairs/master/plugin/auto-pairs.vim >> ${DOTFILES}/symlink/.vim/plugin/auto-pairs.vim
